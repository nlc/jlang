   btc1 =: 3 : 0
ns =. , y
mn =. mean ns
sd =. sdp ns
km =. # ns
bs =. ns > mn
kq =. +/ bs
ka =. mn - sd * %: kq % km - kq
kb =. mn + sd * %: (km - kq) % kq
ka ; kb ; bs
)