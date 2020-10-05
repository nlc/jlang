kaa =: 6 %~ 3 - 2 * ^. 2
kab =: 72 %~ 9 - 4 * *: ^. 2

NB. number of randomly chosen people necessary to guarantee a >= 50% chance
NB. that at least two of them share the same "birthday" out of y possible
NB. "birthdays." n(365) = 23.
npeople =: 3 : '>. (%: 2 * y * ^. 2) + kaa + kab % %: 2 * y * ^. 2'
