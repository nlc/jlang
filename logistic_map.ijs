NB. logistic map definition: x(n+1) =: r * x(n) * (1 - x(n))
lm =: **[:-.]

NB. NB. Uncomment these lines to make a semi-nice plot of the logistic map
NB. require 'viewmat'
NB. load './histogram.ijs'
NB. NB. viewmat ^. 0.0000001 + (%&1000 i. 1000) histogram"(1) (0 + %&1000 i. 4000) lm^:(i. 1000)"(0) 0.5
NB. viewmat ^. 0.0000001 + (%&1000 i. 1000) histogram"(1) 100 }."1 (0 + %&1000 i. 4000) lm^:(i. 1100)"(0) 0.5
NB. exit 3
