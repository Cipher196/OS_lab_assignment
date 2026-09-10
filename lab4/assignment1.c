#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

void *myThread1(void *a) {
  int x, y;
  printf("give intput a: ");
  scanf("%d", &x);
  printf("give intput b: ");
  scanf("%d", &y);

  int *ans = malloc(sizeof(int));
  *ans = x + y;
  return ans;
}

void *myThread2(void *a) {
  int x, y;
  printf("give intput x: ");
  scanf("%d", &x);
  printf("give intput y: ");
  scanf("%d", &y);

  int *ans = malloc(sizeof(int));
  *ans = x - y;
  if (*ans < 0)
    *ans = -1 * (*ans);
  return ans;
}

static volatile int counter = 0;

void *myThread3(void *a) {
  int k = *(int *)a;
  counter += k;
  return NULL;
}

int main() {
  pthread_t t1, t2, t3;

  pthread_create(&t1, NULL, myThread1, NULL);

  void *res1;
  pthread_join(t1, &res1);
  printf("output of t1: res1= %d \n", *(int *)res1);

  pthread_create(&t2, NULL, myThread2, NULL);
  void *res2;
  pthread_join(t2, &res2);

  printf("output of t2: res2= %d \n", *(int *)res2);

  pthread_create(&t3, NULL, myThread3, res1);
  pthread_join(t3, NULL);
  pthread_create(&t3, NULL, myThread3, res2);
  pthread_join(t3, NULL);

  printf("\nSum of res1 and res2: %d", counter);
  return 0;
}
