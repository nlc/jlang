identity =: [: =/~ i.

gen_to_par =: 2&$: :(4 : 0)"2
  mod =. x
  gen =. y
  'k n' =. $ gen

  if. (k {."1 gen) -: identity k do.
    p =. k }."1 gen
    i =. identity n - k

    (mod | - |: p) ,"1 i
  else.
    echo 'Gen. matrix is not in standard form!'
  end.
)

make_encoder =: (2 : 0)"1
  mod =. m
  gen =. n
  str =. y

  mod | (|: gen) +/ . * str
)

make_checker =: (2 : 0)"1
  mod =. m
  par =. n
  code =. y

  mod | par +/ . * code
)

golay_i =: =/~ i. 12
golay_p =: 12 12 $ 1 0 0 1 1 1 1 1 0 0 0 1 0 1 0 0 1 1 1 1 1 0 1 0 0 0 1 0 0 1 1 1 1 1 0 1 1 0 0 1 0 0 1 1 1  1 1 0 1 1 0 0 1 0 0 1 1 1 0 1 1 1 1 0 0 1 0 0 1 1 1 0 1 1 1 1 0 0 1 0 0 1 0 1 1 1 1 1 1 0 0 1 0 0 1 0  0 1 1 1 1 1 0 0 1 0 0 1 0 0 1 1 1 1 1 0 0 1 1 0 0 1 0 1 0 1 0 1 0 1 1 1 1 0 1 0 1 0 1 0 1 0 1 1
golay_gen =: golay_i ,"1 golay_p NB. generator matrix
golay_par =:gen_to_par golay_gen
golay_encode =: 2 make_encoder golay_gen
golay_check =: 2 make_checker golay_gen

hammond_gen =: 4 7 $ 1 1 1 0 0 0 0 1 0 0 1 1 0 0 0 1 0 1 0 1 0 1 1 0 1 0 0 1
hammond_par =: 3 7 $ 1 0 1 0 1 0 1 0 1 1 0 0 1 1 0 0 0 1 1 1 1
hammond_encode =: 2 make_encoder hammond_gen
hammond_check =: 2 make_checker hammond_par
