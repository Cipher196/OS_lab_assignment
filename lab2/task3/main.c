#include <sched.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

volatile sig_atomic_t mode = 0;

/*
    mode = 0 -> CPU-intensive / Running
    mode = 1 -> Ready / Runnable
    mode = 2 -> Waiting for I/O
*/

void handle_signal(int sig) {
  if (sig == SIGUSR1) {
    mode = 1;
  } else if (sig == SIGUSR2) {
    mode = 2;
  }
}

void show_pcb() {
  char command[200];

  printf("\n========== PCB INFORMATION ==========\n");

  printf("\n--- /proc/%d/status ---\n", getpid());

  snprintf(command, sizeof(command),
           "grep -E '^(Name|State|Pid|PPid|Uid|Gid|VmSize|VmRSS|Threads):' "
           "/proc/%d/status",
           getpid());

  system(command);

  printf("\n--- Scheduling information ---\n");

  snprintf(command, sizeof(command),
           "grep -E "
           "'^(se.exec_start|se.vruntime|se.sum_exec_runtime|nr_switches|nr_"
           "voluntary_switches|nr_involuntary_switches)' /proc/%d/sched",
           getpid());

  system(command);

  printf("\n--- Open files ---\n");

  snprintf(command, sizeof(command), "ls -l /proc/%d/fd", getpid());

  system(command);

  printf("=====================================\n\n");

  fflush(stdout);
}

int main() {
  pid_t child;

  printf("=============================================\n");
  printf("   PROCESS STATE AND PCB DEMONSTRATION\n");
  printf("=============================================\n");

  child = fork();

  if (child < 0) {
    perror("fork");
    return 1;
  }

  /*
   * CHILD PROCESS
   */
  if (child == 0) {
    int pipefd[2];
    char buffer[100];

    if (pipe(pipefd) == -1) {
      perror("pipe");
      exit(1);
    }

    signal(SIGUSR1, handle_signal);
    signal(SIGUSR2, handle_signal);

    printf("\nChild PID: %d\n", getpid());
    printf("Parent PID: %d\n", getppid());

    printf("\nCommands from another terminal:\n");
    printf("  kill -SIGUSR1 %d   -> READY/RUNNABLE\n", getpid());
    printf("  kill -SIGUSR2 %d   -> I/O WAITING\n", getpid());
    printf("  kill %d            -> terminate\n", getpid());

    fflush(stdout);

    /*
     * ==========================================
     * PHASE 1: CPU-INTENSIVE / RUNNING
     * ==========================================
     */

    printf("\n[PHASE 1] CPU-intensive / RUNNING\n");
    printf("State should normally be R.\n");

    show_pcb();

    volatile unsigned long long x = 0;

    while (mode == 0) {
      x++;

      /*
       * Prevent compiler optimization.
       */
      if (x == 18446744073709551615ULL)
        x = 0;
    }

    /*
     * ==========================================
     * PHASE 2: READY / RUNNABLE
     * ==========================================
     */

    if (mode == 1) {
      printf("\n[PHASE 2] READY / RUNNABLE\n");
      printf("Process is voluntarily yielding the CPU.\n");
      printf("Linux normally reports this as R (runnable).\n");

      show_pcb();

      /*
       * sched_yield() gives another runnable process
       * a chance to run, but this process remains
       * runnable.
       */
      while (mode == 1) {
        sched_yield();
      }
    }

    /*
     * ==========================================
     * PHASE 3: I/O WAITING
     * ==========================================
     */

    if (mode == 2) {
      printf("\n[PHASE 3] WAITING FOR I/O\n");
      printf("Calling read() on an empty pipe...\n");
      printf("State should become S (sleeping).\n");

      fflush(stdout);

      /*
       * Nobody writes to this pipe.
       *
       * Therefore read() blocks and the process
       * enters the waiting/sleeping state.
       */

      close(pipefd[1]);

      show_pcb();

      read(pipefd[0], buffer, sizeof(buffer));

      close(pipefd[0]);
    }

    return 0;
  }
}
