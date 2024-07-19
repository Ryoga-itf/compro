#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// return next token from position, position will be next position
// (end of the position of token)
char *tokenize(char *input, int *position, char *delimiters) {
  char *p;
  char *head = input + *position;
  if (head == NULL) {
    return NULL;
  }
  if (*head == '\0') {
    return NULL;
  }

  // skip delimiters
  for (p = head; *p != '\0'; p++) {
    int is_delimiter = 0;
    for (int i = strlen(delimiters) - 1; i >= 0; i--) {
      is_delimiter |= (*p == *(delimiters + i));
    }
    if (!is_delimiter) {
      break;
    }
  }

  char *begin = p;
  for (head = p; *p != '\0'; p++) {
    if (*p == '"') {
      p++;
      while (*p != '\0' && *p != '"') {
        p++;
      }
    }

    int is_delimiter = 0;
    for (int i = strlen(delimiters) - 1; i >= 0; i--) {
      is_delimiter |= (*p == *(delimiters + i));
    }
    if (is_delimiter) {
      break;
    }
  }

  if (*p == '\0') {
    head = p;
  } else {
    head = p + 1;
  }

  int size = (head - begin);
  *position = head - input;
  char *ret = malloc(sizeof(char) * size);
  if (ret != NULL) {
    strncpy(ret, begin, size - 1);
    ret[size - 1] = '\0';
  }
  return ret;
}

int main() {
  char s[] = "I have a pen, I have an apple... \"Apple pen!\"\n"
             "I have a pen, I have a pineapple... \"Pineapple pen!\"\n"
             "Applepen...pineapplepen...\"Pen Pineapple Apple Pen!\"\n\n\n"
             "\"Pen Pineapple Apple Pen!\"\n";
  char *p;
  int position = 0;

  while (1) {
    p = tokenize(s, &position, " ,.\n");
    if (p == NULL) {
      break;
    }
    puts(p);
    free(p);
  }

  puts("\n====================\n");
  // show initial string
  puts(s);

  return 0;
}
