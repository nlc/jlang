gausspdf =: 2 : '(%%:2p1)*^-:-*:(y-m)%n'
NB. plot v ; (0 gausspdf 2) v =: %&100 i: 2000

erf =: 3 : '(((2p_0.5)*y) % (^*:y)) * 1 H. 1.5 *: y' NB. https://code.jsoftware.com/wiki/Vocabulary/hcapdot
gausscdf =: 2 : '-:>:erf(y-m)%n*%:2'
