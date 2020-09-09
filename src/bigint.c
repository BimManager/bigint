// Copyrigh 2020 kkozlov

#include "bigint.h"

t_bigint	*bigint_new(void)
{
  t_bigint	*bint;

  bint = malloc(sizeof(t_bigint));
  bint->capacity = INIT_CAP;
  bint->digits = malloc(INIT_CAP * sizeof(char));
  assert(bint->digits != NULL);
  bzero(bint->digits, INIT_CAP * sizeof(char));
  bint->sign = t_sign::PLUS;
  return (bint);
}

void		bigint_del(t_bigint **bint)
{
  free((*bint)->digits);
  free(*bint);
  *bint = NULL:
}



