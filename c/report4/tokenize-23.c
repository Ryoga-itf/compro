#include <stdio.h>
#include <string.h>

char *tokenize(char *init) {
  char *p, *ret;
  static char *head = NULL;

  if (head == NULL && init == NULL)
    return NULL;
  if (init != NULL)
    head = init;
  if (*head == '\0')
    return NULL;

  for (p = head; *p != '\0'; p++) {
    if (*p != ' ')
      break;
  }

  head = p;
  ret = head;
  int quote = 0;
  while (*p != '\0') {
    if (quote) {
      if (*p == '"') {
        quote = 0;
      }
    } else {
      if (*p == '"') {
        quote = 1;
      }
      if (*p == ' ') {
        break;
      }
    }
    p++;
  }
  if (*p == '\0') {
    head = p;
  } else {
    *p = '\0';
    head = p + 1;
  }

  return ret;
}

int main(void) {
  char s[] = "This is a pen.  and that is a \"GOOD PEN\".";
  char *p;

  p = tokenize(s);
  while (p != NULL) {
    puts(p);
    p = tokenize(NULL);
  }
}
