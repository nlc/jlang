Note 'Definition'
 1. If both a and b are nonzero then, a+bi is a Gaussian prime iff a^2+b^2 is an ordinary prime.
 2. If a=0, then bi is a Gaussian prime iff |b| is an ordinary prime and |b|=3 (mod 4).
 3. If b=0, then a is a Gaussian prime iff |a| is an ordinary prime and |a|=3 (mod 4).

 (https://mathworld.wolfram.com/GaussianPrime.html)
)


c0 =: [: +./ 3 = 4&| NB. incomplete
c1 =: 1 p: [: +/ *:

NB. gp =: ((([: +./ 3 = 4 | |) ` (1 p: [: +/ *:)) @. (*@*/))@+.
