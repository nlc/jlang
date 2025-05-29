require 'levenshtein.ijs'
require 'histogram.ijs'
require 'plot'

voyn_words =: ' ' cut fread 'voyn_101_simple.txt'
moby_words =: ' ' cut fread 'moby10b.txt'

voyn_seq_dists =: > 2 (levdist each/) \ voyn_words
moby_seq_dists =: > 2 (levdist each/) \ moby_words
plot (i. 19) ; ((i. 19) histogram voyn_seq_dists) ,: ((i. 19) histogram moby_seq_dists)
