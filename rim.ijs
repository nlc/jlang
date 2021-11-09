NB. Rim around 2D array
rim_fwd =: (1&$:) : (4 : 0)
  dims =. $ y

  (2 $ -x) |. (dims + 2 * x) take y
)

NB. (2 # [: - [) }. ] }.~ 2 # [ NB. ish
rim_inv =: (1&$:) : (4 : 0)
  dims =. $ y

 (dims - 2 * x) take (2 $ x) |. y
)

rim =: rim_fwd :. rim_inv

Note 'Invocation'
  For a padding of size 3:
  verb &.: (3 rim ]) argument
)
