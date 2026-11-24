#include <stdio.h>

int main(void) {
  int count = 0;
  const char *str = "RISC-V is the bomb!!!";

  while (*str) {
    count++;
    str++;
  }

  printf("%d\n", count);
  return 0;
}