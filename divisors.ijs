divisors =: (i.(-.@*@| # [)])"0

aliquotsum =: 1 : '(#~ +/@divisors u ]) y'

perfects =: = aliquotsum
abundants =: > aliquotsum
deficients =: < aliquotsum

NB. Note that this doesn't generate all the
NB. untouchables in the range.
touchables =: [: ~. [: sort +/@divisors
NB. untouchables =: 'Set difference of range and touchables'
