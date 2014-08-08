#include <stdio.h>

extern unsigned int add(unsigned int lhs, unsigned int rhs);
extern void my_puts(const char *s);

int main() {
  char my_string[20];
  sprintf(my_string, "add(40,2) = %u\n", add(40,2));
  my_puts(my_string);
  return 0;
}