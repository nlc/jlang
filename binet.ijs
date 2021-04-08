NB. Binet closed-form Fibonacci formula.
NB. SO solution is 25, this one is 29
NB. SO: %:@5%~[:-/(-:1+(,-)%:5)&^
NB. Very similar to mine actually, mostly just cleverer syntax
b=:s%~[:-/((,1&-)-:>:(s=:%:5))^]

NB. made a useful tool for plotting
ths =: [%~[:i.*

NB. This reveals a neat property of the Fibonacci sequence.
NB. require 'plot'
NB. plot (b"0) _35 + 10 ths 70

echo b"0 i. 10
exit 0
