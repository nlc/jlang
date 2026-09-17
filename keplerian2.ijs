NB. Newton's method
NB. (e iterE M) E
iterE =: 2 : 'y - (y - (m * 1 o. y) + n) % 1 - m * 2 o. y'
iterME =: 1 : 'y - (y - (m * 1 o. y) + x) % 1 - m * 2 o. y'
