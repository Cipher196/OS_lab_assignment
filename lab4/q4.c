#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
  pid_t p1, p2;

  p1 = fork();
  if (p1 == 0) {
    printf("Child 1 working, PID = %d\n", getpid());
    return 0;
  }

  p2 = fork();
  if (p2 == 0) {
    printf("Child 2 working, PID = %d\n", getpid());
    return 0;
  }

  wait(NULL);
  wait(NULL);
  printf("Children finished the task\n");

  return 0;
}
