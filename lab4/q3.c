#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
  printf("Parent P, PID = %d\n", getpid());

  if (fork() == 0) {
    printf("Child P1, PID = %d, Parent PID = %d\n", getpid(), getppid());

    if (fork() == 0) {
      printf("Child P2, PID = %d, Parent PID = %d\n", getpid(), getppid());
    } else {
      wait(NULL);
    }
  } else {
    wait(NULL);
  }
  return 0;
}
