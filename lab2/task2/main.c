
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

volatile sig_atomic_t start_io_wait = 0;

void handle_signal(int sig) {
  if (sig == SIGUSR1) {
    start_io_wait = 1;
  }
}

int main() {
  int pipefd[2];
  char buffer[100];

  if (pipe(pipefd) == -1) {
    perror("pipe");
    return 1;
  }

  // Register SIGUSR1 handler
  signal(SIGUSR1, handle_signal);

  printf("PID: %d\n", getpid());
  printf("Process is now CPU-intensive.\n");
  printf("Send this command to move it to I/O waiting:\n");
  printf("kill -SIGUSR1 %d\n", getpid());
  printf("\n");

  fflush(stdout);

  volatile unsigned long long x = 0;

  /*
   * CPU-intensive phase
   */
  while (!start_io_wait) {
    x++;

    if (x == 18446744073709551615ULL)
      x = 0;
  }

  /*
   * Signal received.
   * Now transition to I/O waiting.
   */

  printf("\nSIGUSR1 received!\n");
  printf("CPU work stopped.\n");
  printf("Process is now waiting for I/O...\n");
  printf("Check with:\n");
  printf("ps -o pid,ppid,state,stat,wchan,cmd -p %d\n", getpid());
  fflush(stdout);

  /*
   * IMPORTANT:
   * Keep pipefd[1] open.
   *
   * Nobody writes to the pipe, so read() blocks indefinitely.
   * This puts the process into a sleeping/waiting state.
   */
  read(pipefd[0], buffer, sizeof(buffer));

  close(pipefd[0]);
  close(pipefd[1]);

  return 0;
}
