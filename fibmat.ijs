NB. Fibonacci with matrices
NB. wip

fm =: 2 2 $ 0 1 1 1
dot =: +/ . *

NB. square the fib mat until you're in range
NB. then use the accumulated intermediate
NB. results to multiply together to
NB. fibmat ^ n
dot/(|. #: 300) # (+/ . *)~^:(i. >. 2 ^. 300) fm
