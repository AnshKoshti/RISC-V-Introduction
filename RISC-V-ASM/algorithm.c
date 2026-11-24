#include <stdio.h>

int count = 0;
char *str = "RISC-V is the bomb";

int main() {
  while (*str) {
    count++;
    str++;
  }
  printf("%d\n", count);
}
