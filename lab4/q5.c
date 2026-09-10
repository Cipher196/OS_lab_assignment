#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
  pid_t pid_child;

  printf("A) Process ID of Parent (P): %d\n", getpid());

  pid_child = fork();

  if (pid_child == 0) {
    printf("C) Process ID of Child (P1): %d\n", getpid());
    printf("D) Parent ID of Child P1: %d\n", getppid());
  } else {
    wait(NULL);
    printf("B) ID of P's Child (P1): %d\n", pid_child);
  }

  return 0;
}
