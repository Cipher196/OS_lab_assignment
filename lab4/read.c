#include <unistd.h>

int main() {
  char buff[20];
  int count = read(0, buff, 10);
  write(1, buff, count);
  return 0;
}
