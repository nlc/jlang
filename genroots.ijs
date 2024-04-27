require 'odometer.ijs'

primes =: cutopen fread 'nsm_semantic_primes.txt'

en_consonants =: 'BDFGHJKLMNPQRSTVWXYZ'

consonant_ngrams =: ] { ~ [: odometer [ # [: # ]

select_n_of =: ] { ~ [: ? [ # [: # ]

sample_one =: ?@#{]

NB. (#primes) times, generate a random consonantal root of length MIN..MAX, sampling consonants from variable (<length> consonant_ngrams <my_consonants>)
NB. Make list of (#primes) randomly-selected values from (MIN..MAX)
NB. For each value,
NB.  sample_one <value> consonant_ngrams <my_consonants>


NB. Note that this doesn't guarantee uniqueness. Use at your own risk.

Note 'example'

)
