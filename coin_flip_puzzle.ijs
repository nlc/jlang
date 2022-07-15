NB. https://math.stackexchange.com/questions/4492477/coin-flip-probability-independent-or-not
require 'format/printf'
require './seed.ijs'

seed ''

flips =: 4 : 'x > ? y $ 0'

'73/82 = %.3f' printf 1.0 * 73r82
'11/20 = %.3f' printf 1.0 * 11r20
echo {: (}.%}:) +/ (2 6 $ 1 1 1 1 1 0 1 1 1 1 1 1) (e.~ # ]) (0.5 1 {~ 0.1 flips 100000) flips"(0) 6

exit 3
