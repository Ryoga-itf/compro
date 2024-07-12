#include <stdio.h>
#define NUM (8)

void print_unsigned_bitseq(unsigned value) {
  const size_t length = sizeof(value) * 8;
  for (size_t i = 0; i < length; i++) {
    putchar((value & (1 << (length - i - 1))) ? '1' : '0');
  }
  putchar('\n');
}
void print_float_bitseq(float value) {
  const size_t length = sizeof(value) * 8;
  const float *ptr = &value;
  const unsigned long int bitseq = *((unsigned long int *)&value);
  for (size_t i = 0; i < length; i++) {
    putchar((bitseq & (1 << (length - i - 1))) ? '1' : '0');
    if (i == 0 || i == 8) {
      putchar('|');
    }
  }
  putchar('\n');
}

int main(void) {
  const unsigned unsigned_arr[NUM] = {0, 1, 2, 3, 4, 5, 6, 7};
  const int float_arr[NUM] = {0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0};
  for (int i = 0; i < NUM; i++) {
    print_unsigned_bitseq(unsigned_arr[i]);
    print_float_bitseq(float_arr[i]);
    puts("---");
  }
  return 0;
}
