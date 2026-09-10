#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
  printf("Parent P, PID = %d\n", getpid());

  if (fork() == 0) {
    printf("Child P1 created, PID = %d\n", getpid());
  } else {
    wait(NULL);
    if (fork() == 0) {
      printf("Child P2 created, PID = %d\n", getpid());
    } else {
      wait(NULL);
      if (fork() == 0) {
        printf("Child P3 created, PID = %d\n", getpid());
      } else {
        wait(NULL);
      }
    }
  }
  return 0;
}
