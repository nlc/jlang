require 'levenshtein.ijs'
require 'histogram.ijs'
require 'plot'

normalize =: % +/

voyn_words =: ' ' cut fread 'voyn_101_simple.txt'
moby_words =: ' ' cut fread 'moby10b.txt'

NB. Hist of word lengths
voyn_lengths =: > # each voyn_words
moby_lengths =: > # each moby_words
is =: i. 1 + >./ voyn_lengths , moby_lengths
voyn_lengths_hist =: normalize is histogram voyn_lengths
moby_lengths_hist =: normalize is histogram moby_lengths
plot is ; voyn_lengths_hist ,: moby_lengths_hist


NB. Hist of Levenshtein dist. of sequential words
voyn_seq_dists =: > 2 (levdist each/) \ voyn_words
moby_seq_dists =: > 2 (levdist each/) \ moby_words

is =: i. 1 + >./ voyn_seq_dists , moby_seq_dists
voyn_seq_hist =: normalize is histogram voyn_seq_dists
moby_seq_hist =: normalize is histogram moby_seq_dists
plot is ; voyn_seq_hist ,: moby_seq_hist
