NB. Euler's Gradus Suavitatis or "Degree of Agreeableness"
NB. Given a ratio of tones, returns a positive integer
NB.   representing what Euler thought was a measure of the
NB.   "pleasantness" of the chord formed by those tones.

NB. Line-oriented
>: +/ */ (_1 0) + 2&p: *./ 4 5 6 NB. Major triad
NB. 9

NB. Tacit definition
gradus =: [: >: [: (+/ .*)/ [:(_1 0)&+ [: 2&p: *./
gradus 15 8 NB. "Ti" of just intonation
NB. 10

NB. "def" explicit definition (using Pete Corey's clever q: trick)
NB.   plus a little ampdotco flair of my own
gradus =: 3 : '+/&.:<:q:*./y'
