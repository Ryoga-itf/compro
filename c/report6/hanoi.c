#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define N_TOWER 3

unsigned *tower[N_TOWER];
unsigned *top[N_TOWER];
unsigned n_input;
unsigned n_steps = 0;

void print_tower(unsigned i) {
  assert(0 <= i && i < N_TOWER);
  unsigned *p = tower[i];

  printf("%d|", i);
  while (p != top[i]) {
    printf("%d]", *p);
    p++;
  }
  printf("\n");
}

void print_towers() {
  int i;
  for (i = 0; i < N_TOWER; i++) {
    print_tower(i);
  }
}

void move(unsigned from, unsigned to) {
  printf("### move %d to %d\n", from, to);
  assert(0 <= from && from < N_TOWER);
  assert(0 <= to && to < N_TOWER);
  assert(from != to);
  *top[to] = *(top[from] - 1);
  top[to]++;
  top[from]--;
  print_towers();
  n_steps++;
}

int verify_towers(unsigned i, unsigned *t[N_TOWER]) {
  int count = 0;
  int end = 0;
  for (int j = 0; j < N_TOWER; j++) {
    if (t[j] == top[j]) {
      end++;
    } else if (*t[j] == i) {
      count++;
      t[j]++;
    }
  }
  if (i == 0) {
    return end == 3;
  } else if (count != 1) {
    return 0;
  } else {
    return verify_towers(i - 1, t);
  }
}

void hanoi(unsigned n, unsigned cur_pos, unsigned dest_pos) {
  assert(0 < n);
  assert(0 <= cur_pos && cur_pos < N_TOWER);
  assert(0 <= dest_pos && dest_pos < N_TOWER);

  if (n == 1) {
  // step0
    move(cur_pos, dest_pos);
  } else {
    int rest_pos;
    for (rest_pos = 0; rest_pos < N_TOWER; rest_pos++) {
      if (rest_pos != cur_pos && rest_pos != dest_pos) {
        break;
      }
    }
    assert(rest_pos < N_TOWER);
    // step1
    hanoi(n - 1, cur_pos, rest_pos);
    // step2
    move(cur_pos, dest_pos);
    // step3
    hanoi(n - 1, rest_pos, dest_pos);
  }

  
  unsigned *t[N_TOWER];
  for (int i = 0; i < N_TOWER; i++) {
    t[i] = tower[i];
  }
  if (verify_towers(n_input, t)) {
    puts("### verify: OK");
  } else {
    puts("### verify: FAILED");
    print_towers();
    exit(EXIT_FAILURE);
  }
}

int main(int argc ,char **argv) {
  int  i;

  assert(argc == 2);
  n_input = atoi(argv[1]);
  assert(n_input > 0);

  for (i = 0; i < N_TOWER; i++) {
    tower[i] = malloc(n_input * sizeof(unsigned));
    if (tower[i] == NULL) exit(EXIT_FAILURE);
    top[i] = tower[i];
  }
  for (i = 0; i < n_input; i++) {
    *top[0] = n_input - i;
    top[0]++;
  }

  puts("### start");
  print_towers();
  hanoi(n_input, 0, 2);
  printf("### %d steps to complete\n", n_steps);

  return 0;
}
