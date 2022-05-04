Note 'https://en.wikipedia.org/wiki/Kaprekar%27s_routine'
    In number theory, Kaprekar's routine is an iterative algorithm that, with
  each iteration, takes a natural number in a given number base, creates two
  new numbers by sorting the digits of its number by descending and ascending
  order, and subtracts the second from the first to yield the natural number
  for the next iteration. It is named after its inventor, the Indian
  mathematician D. R. Kaprekar.
    Kaprekar showed that in the case of four-digit numbers in base 10, if the
  initial number has at least two distinct digits, after seven iterations this
  process always yields the number 6174, which is now known as Kaprekar's
  constant.
)

NB. <number of digits> kaprekar <base>
kaprekar =: 2 : '[:|@-/(,:|.)@sort&.:((m # n)#:])'

Note 'Demonstrations'
  K4b10 =: 4 kaprekar 10
  echo K4b10^:(_) 8174 NB. ==> 6174

  K3b10 =: kaprekar 10
  K3b10^:(_) 123 NB. ==> 495

  K3b4 =: 3 kaprekar 4
  K3b4^:(_) 31 NB. ==> 30 = 4b132
  exit 1
)
