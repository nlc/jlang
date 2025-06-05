Note 'Attribution'
  https://oeis.org/A005940
  Algorithm from notes in the Formula section by Zumkeller and Mathar.
)

A005940_f =: 3 : 0 M.
  'n i x' =. y
  if. n = 0 do.
    x
  elseif. 0 = 2 | n do.
    A005940_f (n % 2) , (i + 1) , x
  else.
    A005940_f ((n - 1) % 2) , i , x * p: i - 1
  end.
)

A005940 =: (3 : 0)"0
  A005940_f (y - 1) , 1 1
)
