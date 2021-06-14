randidx =: (?@#~/@$)@|:
getface =: randidx{"0 1]
shuffle =: (#?#){]

dice =: > cutopen (1!:1) < 'boggle_dice.txt'

boggle =: 4 4&$@shuffle@getface

rimb =: _1: ,. (_1: , ] , _1:) (,.) _1: NB. per Hui
neighbors =: (4 1 4 # 1 0 1)#"1 [: ,"2 [: ,/ 3 3 ];._3 rimb@i.@,~
