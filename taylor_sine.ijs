Note 'Sine Taylor series'
  sin(x) = x - (x^3/3!) + (x^5/5!) - ...

  The coefficient form is:
  0 1 0 , (-%!3) , 0 , (%!5) , 0 , (-%!7) , 0 ...
)

stc =: 0 1 0 , (-%!3) , 0 , (%!5) , 0 , (-%!7) , 0 , (%!9) NB. error is under 1e_9 up to 0.7

NB. generate algorithmically?
NB. note that 1j1&# is useful for
NB. inserting zeroes between the
NB. elements of a list.
