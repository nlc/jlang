NB. Create a set of instructions for drawing a Koch curve using an L-system.
NB. 's' - draw a straight segment
NB. 'l' - turn 60deg to the left
NB. 'r' - turn 60deg to the right
iter =: ('s' ; 'slsrsls')&rxrplc

NB. iter^:5 's'
