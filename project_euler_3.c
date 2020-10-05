#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>

/* Find the largest prime factor of a number */
/* Semi-naive algo using trial division */

uint64_t greatestDivisorBelow(uint64_t number, uint64_t upperLimit) {
  uint64_t rootN = (uint64_t)sqrtl(number);
  if(upperLimit > rootN || upperLimit < 0) {
    upperLimit = rootN;
  }

  for(uint64_t i = upperLimit - 1; i > 0; --i) {
    if(number % i == 0) {
      return i;
    }
  }

  return 1;
}

int main(int argc, char **argv) {
  uint64_t subject;
  if(argc < 2) {
    return 1;
  }

  subject = strtoull(argv[1], NULL, 10);
  
  uint64_t divisor = greatestDivisorBelow(subject, subject);
  while(divisor > 1) {
    uint64_t quotient = greatestDivisorBelow(divisor, divisor);
    if(quotient < 2) {
      break;
    }
    divisor = greatestDivisorBelow(subject, divisor);
  }
  printf("largest prime factor of %"PRIu64" = %"PRIu64"\n", subject, divisor);
}
