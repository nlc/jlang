NB. Recursive Fibonacci as an exercise in getting to know
NB.   the $: verb

fib =: (0:`1:`($:@-&1 + $:@-&2)@.(>&0 + >&1))"0 M.
