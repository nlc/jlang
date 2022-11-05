divisors =: (i.(-.@*@| # [)])"0

aliquotsum =: 1 : '(#~ +/@divisors u ]) y'

perfects =: = aliquotsum
abundants =: > aliquotsum
deficients =: < aliquotsum
