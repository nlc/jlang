lr =: 4 : 'y %. 1 ,. x' NB. http://blog.vmchale.com/article/j-concise

NB. NB. a simple example of extrapolation:
NB. NB. given a list of successive integers (x) and their corresponding
NB. NB. dependent values for (y), returns y with the linearly-extrapolated
NB. NB. next term appened to it.
NB.    0 1 2 3 (([,[:>:{:)@[ p.~ lm) 1 3 5 7
NB. 1 3 5 7 9
