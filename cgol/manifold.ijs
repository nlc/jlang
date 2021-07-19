NB. Based on concepts found in http://dfns.dyalog.com/n_life.htm

bookend =: {: , ] , {.

connectedge =: 1 : '(u {: y) , y , (u {. y)' NB. connect one edge
connectedges =: 2 : '(u connectedge)&.|: (v connectedge) y' NB. connect two edges

join =: ]
block =: 0:
twist =: |.

trim =: [: (1 _1 }. ])&.|: 1 _1 }. ] NB. trim off edges

plane =: 1 : 'trim u block connectedges block y'
cylinder =: 1 : 'trim u join connectedges block y'
torus =: 1 : 'u y' NB. Default behavior
mobius =: 1 : 'trim u twist connectedges block y'
klein =: 1 : 'trim u twist connectedges join y'
rp2 =: 1 : 'trim u twist connectedges twist y'
