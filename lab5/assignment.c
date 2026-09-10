#include <stdio.h>
#include <unistd.h>

#include <pthread.h>

int lock = 0;

int counter = 0;

int test_and_set(int *result) {
  int initial = *result;
  *result = 1;
  return initial;
}

void *work() {
  while (__sync_lock_test_and_set(&lock, 1)) {
  }
  for (int i = 0; i < 1e7; i++)
    counter++;
  __sync_lock_release(&lock);
  return NULL;
}

int main() {
  pthread_t t1, t2;

  pthread_create(&t1, NULL, work, NULL);
  pthread_create(&t2, NULL, work, NULL);

  pthread_join(t1, NULL);
  pthread_join(t2, NULL);

  printf("%d", counter);
  return 0;
}
