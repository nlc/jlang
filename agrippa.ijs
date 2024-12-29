NB. arbitrarily chosen derangement
perm =: (12763 A. ])"1

NB. TODO make this less insanely stupid
mexp=:([: (4097 | *)/ 3491 # ])"0 M.

agrippa3byte =: [: #. [: (3 8 $ ,) (2 12$2) #: [: mexp [: #. [: (2 12 $ ,) [: perm (3 8$2) #: ]
