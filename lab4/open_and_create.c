#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

extern int errno;

int main() {
  int fd = open("timepass.txt", O_RDONLY | O_CREAT);
  printf("fd = %d\n", fd);

  if (fd == -1) {
    printf("Error: %d\n", errno);
    perror("Program");
  }

  close(fd);
  return 0;
}
