load 'lfsr.ijs'
load 'ita2.ijs'

NB. get ciphertext via mild hax
ct =: ,/ (5 # 10) #:"(1 0) > ". each 6 7 { cutopen (1!:1) < 'puzzle.txt'

(2| l2^:(i. 75) 2) XOR , (ita 'quick brown fox') NB. basic enciphering via lfsr stream
