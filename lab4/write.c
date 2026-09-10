#include <stdio.h>
#include <unistd.h>

int main() {
  int count = write(1, "Ahshan\n", 7);
  printf("Bytes written: %d\n", count);
  return 0;
}
