points =: 2 8 $ p: i. 13 NB. 2D points
euclid =: [:+/&.:*:- NB. Euclidean distance
(|: points) euclid"1/ (|: points) NB. Table of euclidean distances
euclid"1/~|:points NB. this is a better way to write it, that way is stupid
