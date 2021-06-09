randidx =: (?@#~/@$)@|:
getface =: randidx{"0 1]
shuffle =: (#?#){]

dice =: > cutopen (1!:1) < 'boggle_dice.txt'

boggle =: 4 4&$@shuffle@getface
