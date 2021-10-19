Note 'Sine Taylor series'
  sin(x) = x - (x^3/3!) + (x^5/5!) - ...

  The coefficient form is:
  0 1 0 , (-%!3) , 0 , (%!5) , 0 , (-%!7) , 0 ...
)

sincoefs =: [: }: 0 , 1j1 # (_1&^ % !@>:@+:)"0 @ i.
