NB. silly brute-force solve of XKCD #173, assigning the weights as follows:
NB.   4 to "in a relationship"
NB.   2 to "friends"
NB.   1 to "acquaintances"
NB.   1 to "one-way crush"

perms =: i.@! A. i.

cm =: 8 8 $   0 4 0 0 0 0 0 0   4 0 2 2 0 0 0 0   0 2 0 1 2 0 0 0   0 2 1 0 0 0 0 0   0 0 2 0 0 4 0 1   0 0 0 0 4 0 1 2   0 0 0 1 0 1 0 0   0 0 0 0 1 2 0 0
dim =: # cm
wt =: cm&(<@] { [)

nbrwts =: }.([: wt [ , ])"0}:

score =: (+/@nbrwts)"1

permscores =: score perms dim
bestpermscore =: >./ permscores
bestpermidxs =: I. bestpermscore = permscores

echo bestpermidxs A. i. dim

exit 0
