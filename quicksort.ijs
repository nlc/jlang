NB. Recursive quicksort with $:
qs =: ($:@(#~]<{.),(#~]={.),$:@(#~]>{.))`]@.(2>#)

NB. Simplified using a pivot-ifying adjective
p =: 1 : '(#~ ] u {.) y' NB. "Pivot-ify"
qsp =: ($:@(<p),(=p),$:@(>p))`]@.(2>#)

NB. Maybe 50% or so slower than native sort. Unsure of the latter's algo
