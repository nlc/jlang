bookend =: {: , ] , {.

connectedge =: 1 : '(u {: y) , y , (u {. y)' NB. connect one edge
connectedges =: 2 : '(u connectedge)&.|: (v connectedge) y' NB. connect two edges

connectedges2 =: 2 : '(v {: y) , y , (v {. y)' NB. connect

m =: i. 3 3
