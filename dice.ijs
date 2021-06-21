d =: >:@?@$ NB. 5 d 20 => 17 16 10 13 4
sumd =: [:+/d NB. 5 sumd 20 => 60

NB. average sum of die roll
avgsumd =: [:-:[+* NB. 5 avgsumd => 52.5


NB. Applications below:

NB. Calculate falling damage from D&D 5e:
NB. "At the end of a fall, a creature takes 1d6 bludgeoning damage for every
NB. 10 feet it fell, to a maximum of 20d6."
falldmg =: 6 sumd~"0 ([: 20&<. [:<.%&10)
