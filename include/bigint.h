// Copyright 2020 kkozlov

#ifndef BIGINT_H
# define BIGINT_H

# define INIT_CAP	128

typedef enum	e_sign
{
  MINUS, PLUS
}				t_sign;

typedef struct	s_bigint
{
  char			*digits;
  size_t		imsd;
  size_t		capacity;
  t_sign		sign;
}				t_bigint;

t_bigint		*bigint_new(void);
void			bigint_del(t_bigint **bint);

#endif
