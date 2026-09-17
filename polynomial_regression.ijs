Note 'Polynomial regression'
   Fitting n data points (x_i, y_i) with a polynomial of degree m:
   Given:

      { y_1 }   { 1 x_1^1 x_1^2 ... x_1^m } { b_0 }   { e_1 }
      { y_2 }   { 1 x_2^1 x_2^2 ... x_2^m } { b_1 }   { e_2 }
      { ... } = { ...     ...       ...   } { ... } + { ... }
      { y_n }   { 1 x_n^1 x_n^2 ... x_n^m } { b_m }   { e_n }

   i.e.

      y = X b + e,

   the vector of estimated coefficients bhat_i is given by:

      bhat = (XT X)^-1 XT y

   ---
   Usage:
   <xs> (<degree> pr) <ys>
)

pr =: 1 : 'y (+/ . *)~ (|: (+/ . *)~ [: %. |: +/ . * ]) x ^"(0 1) i. m + 1'
