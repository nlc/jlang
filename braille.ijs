(9 !: 37) 0 1024 0 1024 NB. adjust as needed

binary2braille =: 3 : 0
  assert 2 = # $ y

  br =: [: u: 10240&+
  n2b =: ([: br 0 2 4 1 3 5 6 7&{&.|.&.((8$2)&#.^:_1))"0
  g2b =: (4 2 ,: 4 2)&(([:n2b[:#.[:|.,);._3)

  g2b"2 y
)

NB. NB. Example output in lenna.txt
NB. echo binary2braille -. ". > 2 }. cutLF fread 'lenna.pbm'
NB. exit 0
