Note 'Puzzle'
  There are two integers each between 1 and 100.  P knows their product,
  S knows their sum.  Obviously, if they told each other the sum and
  product, they could figure out what the integers were.  Instead, they
  have the following conversation:

   P:  I don't know what the numbers are.
   S:  I knew you didn't.  Neither do I.
   P:  Oh! Now I know.
   S:  Oh! So do I.

  What are the two integers?
)

Note 'Implications'
  P:  I don't know what the numbers are.
    - Numbers can't be determined from the product
    - Thus: there must be multiple ways to form the product from the the set 1..100
    - Thus: P isn't prime (is there any stronger statement we can make?)
  S:  I knew you didn't.
    - You can tell FROM THE SUM that the PRODUCT is indeterminate.
      - For all p, q in 1..100 s.t. p+q=S, p*q is not prime ... ?
    - Thus: S is such that P must be prime.
  S:  Neither do I.
    - Numbers can't be determined from the sum.
  ...
)

Note 'Some obvious outliers'
  S = 2 <-> P = 1
  S = 200 <-> P = 10000
  Primes?
)

NB. Function to take a sum and return all possible pairs
all_sum_to =: [: ~. sort"1@|:@(,:|.)@i.@>:
sum_to =: (([: AND/"1 (0&< AND <:&100)) # ])@all_sum_to NB. filter out sums involving <1 or >100
num_sum_to =: #@sum_to

NB. Function to take a product and return all possible pairs
divisors =: [: }. [: I. [: (= <.) [: (% i.@>:) ]
all_mul_to =:  [: ~. sort"1@|:@(,:|.)@divisors
