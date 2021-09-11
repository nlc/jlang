Note 'Various wrinkles'
  The rotors step BEFORE the letter is enciphered.
  The ring settings can apply a caesar cipher to the output from each rotor.
  The stepping is not odometer-like (see Note 'Odometer').
)

Note 'Configuration'
  Keyboard
  Plugboard
  Rotor 3
  Rotor 2
  Rotor 1
  Reflector
  Rotor 1
  Rotor 2
  Rotor 3
)

ordfwd =: 65 -~ a. i. ]
chrfwd =: a. {~ 65 + ]
ord =: ordfwd :. chrfwd
chr =: chrfwd :. ordfwd

rotorsdata =: > cutopen each cutopen fread 'enigma_rotors.txt'
'allrotornames allrotorstrs allnotchstrs' =: |: rotorsdata
allrotors =: ord allrotorstrs NB. Turn rotors into permutation info
allnotches =: ord allnotchstrs

reflectorsdata =: > cutopen each cutopen fread 'enigma_reflectors.txt'
allreflectorsstrs =: 1 pick"1 reflectorsdata
allreflectors =: ord allreflectorsstrs

NB. is there a better way to do this than this weird
NB. nested rank specifier?
NB. this isn't even right, see Note 'Odometer'
NB. allsettings =: (odometer #"1 rotors) ({"0 1)"1 2 rotors

NB. pass through the assembly:
rotors =: { 3 {. allrotors NB. Starting configuration
notches =: , 3 {. allnotches NB. Starting configuration
reflector =: 1 { allreflectors
plaintextstr =: 'ABCDE'
plaintext =: ord plaintextstr
configuration =: (/: each |. rotors) , reflector ; rotors
ciphertext =: > {~each/ configuration ,< plaintext NB. append plaintext, and then just reduce on indexing!

echo chr ciphertext

recovertext =: > {~each/ configuration ,< ciphertext

echo chr recovertext

Note 'Presumed process'
  Rotors I, II, III, Reflector B, Setting AAA:

  A --> B --> J --> Z ==> T --> P --> C --> F
    III   II     I    REF    I    II    III

  So at the moment, THIS doesn't match what I see online (A->U),
  and the actual execution(A->E) doesn't match either one. Great.

  It seems like something's going wrong around the transition from R-1?
  It follows the above pattern up to the output from REF, but then
  it reports A instead of P.

  OF COURSE the mappings are inverted when you go through the rotor
  the opposite way. Adding a grade to the return-trip rotors should help.
)

Note 'Odometer'
  The enigma *does not* step forward exactly like an odometer.
  Make sure to properly implement a "double-stepping" index
  generator because using the standard odo function will not
  give valid output.
)

Note 'Operation'
  'initial machine state' Enigma 'plaintext' ?
  => 'ciphertext'                            ?

  What if you want to encode another message afterward?

  Ugly as it is, maybe some nested boxes, like
  Enigma [ 'initial machine state' | 'plaintext' ]

  That would allow a more purely functional approach.
)

lastboxof =: _1}

advancerotors =: 4 : 0
  notches =. x
  rotors =. y

  (1&|. each _1 { rotors) lastboxof rotors
)
