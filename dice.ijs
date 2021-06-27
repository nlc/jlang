d =: >:@?@$ NB. 5 d 20 => 17 16 10 13 4
sumd =: [:+/d NB. 5 sumd 20 => 60

NB. average sum of die roll
avgsumd =: [:-:[+* NB. 5 avgsumd => 52.5

advantage =: 1 : '(x u y) >. (x u y)'
disadvantage =: 1 : '(x u y) <. (x u y)'

NB. Applications below:

NB. Calculate falling damage from D&D 5e:
NB. "At the end of a fall, a creature takes 1d6 bludgeoning damage for every
NB. 10 feet it fell, to a maximum of 20d6."
falldmg =: 6 sumd~"0 ([: 20&<. [:<.%&10)

NB. Calculate the range of HP of an ancient black dragon from D&D 5e:
NB. "Hit Points 367 (21d20 + 147)"
load 'plot'
load './histogram.ijs'
plotancientblackdragonhp =: 3 : 'plot y %~ (i. 600) histogram 147 + (21 , y) sumd 20'

NB. plotancientblackdragonhp 100000
