NB. Given that each node in a stochastically branching structure has n sites,
NB. each of which becomes a child with some constant probability P, then
NB. p_i is the probability of a node having exactly i children.
NB. (<P> p_i <n>) i
p_i =: (2 : '(y ! n) * (m ^ y) * (1 - m) ^ (n - y)')"0

NB. The expectation value for the number of children a node has is
NB. the dot product with the vector i. n + 1
NB. <P> avgchildren <n>
avgchildren =: 4 : '(+/ . * (x p_i y)) i. y + 1' NB. this might actually just be equivalent to *...
