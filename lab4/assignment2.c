#include <assert.h>
#include <bits/pthreadtypes.h>
#include <pthread.h>
#include <stdio.h>

// static volatile int counter = 0; // In this commented code we will see
// non-deterministic code
//
// void *myThread(void *a) {
//   printf("%s: begin\n", (char *)a);
//   for (int i = 0; i < 1000000; i++) {
//     counter++;
//     // One Process might read counter at a certion and work on it but it
//     might happen that this process dont save counter value before contex
//     swithing and when a new try to fetch counter value it will fetch old
//     value
//   }
//   printf("%s: end\n", (char *)a);
//   return NULL;
// }

pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

static int counter = 0;

void *myThread(void *a) {
  printf("%s: begin\n", (char *)a);
  for (int i = 0; i < 1000000; i++) {
    pthread_mutex_lock(&lock);
    counter++;
    pthread_mutex_unlock(&lock);
  }
  printf("%s: end\n", (char *)a);
  return NULL;
}

int main() {
  pthread_t p1, p2, p3;
  int rc;
  printf("main: begin\n");

  rc = pthread_create(&p1, NULL, myThread, "A");
  assert(rc == 0);
  rc = pthread_create(&p2, NULL, myThread, "B");
  assert(rc == 0);
  rc = pthread_create(&p3, NULL, myThread, "C");
  assert(rc == 0);

  rc = pthread_join(p1, NULL);
  assert(rc == 0);
  rc = pthread_join(p2, NULL);
  assert(rc == 0);
  rc = pthread_join(p3, NULL);
  assert(rc == 0);

  printf("main: end\n counter: %d ", counter);
  return 0;
}
