NB. https://xkcd.com/2435

mean =: +/%#
geom =: mean&.^.
median=: <.@-:@# { /:~

f =: mean , geom , median

gmdn =: [: {. f (^:_)

gmdn 1 1 2 3 5 NB. 2.08906
