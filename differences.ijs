diffs =: }.-}:

naz =: +./ NB. not all zeros

bd =: diffs^:([:naz])^:_ NB. break down. this can't handle certain zeros for some reason

loz =: [: # bd NB. length of bottom zero array.

deg =: # - loz NB. "degree" of sequence (if equal to length then indeterminate)


v =: +/\i.7
