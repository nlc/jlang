require 'histogram.ijs'

taxicab =: ([: (4&<:@(~. histogram ]) # ~.) [: sort@, [: +/~ [: (^&3) 1 + i.

NB. taxicab 15 ==> 1729
NB. taxicab 30 ==> 1729 4104 13832 20683
