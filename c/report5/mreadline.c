#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *mreadline(FILE *fp) {
  char *mem = NULL;
  size_t memsize = 8;
  size_t len = 0;

  mem = malloc(memsize);
  if (mem == NULL) {
    exit(EXIT_FAILURE);
  }

  while (1) {
    if (fgets(mem + len, memsize - len, fp) == NULL) {
      if (ferror(fp)) {
        free(mem);
        exit(EXIT_FAILURE);
      }
      if (feof(fp)) {
        if (len == 0) {
          free(mem);
          return NULL;
        }
        return mem;
      }
    }

    len += strlen(mem + len);

    if (mem[len - 1] == '\n') {
      break;
    } else {
      memsize *= 2;
      char *new_mem = realloc(mem, memsize);
      if (new_mem == NULL) {
        free(mem);
        exit(EXIT_FAILURE);
      }
      mem = new_mem;
    }
  }

  if (mem[len - 1] == '\n') {
    mem[len - 1] = '\0';
  }

  return mem;
}

int main(int argc, char **argv) {
  char *line;

  while (1) {
    line = mreadline(stdin);
    if (line == NULL) {
      break;
    }
    puts(line);
    free(line);
  }
}
