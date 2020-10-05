#include <stdio.h>
#include <stdlib.h>

#define uint unsigned int

/* let's see how this motherfucker handles a static array of size 200k */
#define TSIZE 200000
uint composite[TSIZE] = { 0 };

int main(int argc, char **argv) {
  uint printAll = 1;
  uint target;
  if(argc >= 2) {
    printAll = 0;
    target = atoi(argv[1]);
    if(target < 1) {
      printf("target should be >= 1\n");
      return 0;
    }
  }

  uint count = 0;
  uint lastPrime;
  for(uint factor = 2; factor < TSIZE / 2; ++factor) {
    if(composite[factor]) {
      /* go to the next factor; this one's proven composite already */
    } else {
      ++count;
      lastPrime = factor;

      if(printAll) {
        printf("%u\n", lastPrime);
      } else if(count == target) {
        printf("%u\n", lastPrime);
        return 0;
      }

      for(uint i = 2 * factor; i < TSIZE; i += factor) {
        composite[i] = 1;
      }
    }
  }

  for(uint i = lastPrime + 1; i < TSIZE; ++i) {
    if(!composite[i]) {
      ++count;
      if(printAll) {
        printf("%u\n", i);
      } else if(count == target) {
        printf("%u\n", i);
        return 0;
      }
    }
  }

  if(!printAll && count < target) {
    printf("that prime index is out of range (%u > %u)!\n", count, target);
  }

  return 0;
}
