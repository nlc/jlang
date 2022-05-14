midion =: ('on ',5|.' 100 ',":)"0
midioff =: ('off ',5|.' 100 ',":)"0
NB. play =: [:2!:1'/usr/local/bin/sendmidi dev "J PORT 1" ',[:,/midion
play =: [:2!:1'/usr/local/bin/sendmidi dev "IAC Driver Bus 1" ',[:,/midion
stop =: [:2!:1'/usr/local/bin/sendmidi dev "IAC Driver Bus 1" ',[:,/midioff

major =: 0 2 4 5 7 9 11 12 NB. Major scale
minor =: 0 2 3 5 7 8 10 12 NB. Minor scale
NB. play 60 + ((2?#) { ]) minor NB. play 2 random notes from the major scale
