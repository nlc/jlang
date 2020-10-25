midion =: ('on ',5|.' 100 ',":)"0
play =: [:2!:1'/usr/local/bin/sendmidi dev "J PORT 1" ',[:,/midion

major =: 0 2 4 5 7 9 11 12 NB. Major scale
minor =: 0 2 3 5 7 8 10 12 NB. Minor scale
play 60 + ((2?#) { ]) minor NB. play 2 random notes from the major scale
