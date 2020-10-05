digits =: (10#~([:>.[:10&^.1&+))#:]
NB. digits 1234 => 1 2 3 4

digits2 =: (10#~([:>:[:<.10&^.))#:]

NB. Get highest prime under 100
p:<:>:^:(100>[:p:])^:_(1)
