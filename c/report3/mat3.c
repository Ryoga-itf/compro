#include <stdio.h>
#define DIM 3

void print_matrix(double mat[DIM][DIM]) {
  for (int i = 0; i < DIM; i++) {
    putchar('|');
    for (int j = 0; j < DIM; j++) {
      printf(" %07.4f", mat[i][j]);
    }
    printf(" |\n");
  }
}

int main() {
  double A[DIM][DIM] = {
      {1.0, 2.0, 3.0},
      {4.0, 5.0, 6.0},
      {7.0, 8.0, 9.0},
  };

  print_matrix(A);

  // transposition
  double At[DIM][DIM];
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      At[j][i] = A[i][j];
    }
  }

  // 90 degree clockwise rotation
  double B[DIM][DIM];
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      B[j][DIM - i - 1] = At[i][j];
    }
  }

  puts(""); // break line

  print_matrix(B);

  return 0;
}
