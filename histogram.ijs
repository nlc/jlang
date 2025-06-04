histogram =: <:@(#/.~)@(i.@#@[ , I.) NB. https://code.jsoftware.com/wiki/Essays/Histogram

autohistogram =: (sort@~. ([ ,: histogram) ])
autohistogram2 =: (2 }.&.:|."1 i.@(>./) ([ ,: histogram) ]) NB. doesn't assume all bins have >0 entries
