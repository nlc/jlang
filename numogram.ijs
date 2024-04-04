REGIONNAMES =: 'PLEX' ; 'TORQUE' ; 'WARP'
PLANETNAMES =: 'SUN' ; 'MERCURY' ; 'VENUS' ; 'EARTH' ; 'MARS' ; 'JUPITER' ; 'SATURN' ; 'URANUS' ; 'NEPTUNE' ; 'PLUTO'

digits_fwd =: 10&#.^:_1                   NB. Decimal Digits of a number.
digits_inv =: 10&#.                       NB.   ...
digits =: digits_fwd :. digits_inv        NB.   ...
dcumulate =: -:@*>:                       NB. Digital Cumulation (Nth triangular number)
dreiterate =: digits^:_1@#                NB. Digital Reiteration
twin =: 9&-                               NB. Syzygetic Twin (match with descending digits)
dreduce =: (0:`(1 + 9 | <:)@.*)"0         NB. Digital Reduction (repeated sum of decimal digits of a number); equiv. to (+/@digits)^:_
gate =: dreduce@dcumulate                 NB. "Gate" linking one digit to another (reduction of cumulation)
tractor =: _9 2 |@p. ]                    NB. Map to Plex/Torque/Warp "Tractor-Zone"
regionidx =: (1 + 0 = 3 | ])*(1 = 0 8&I.) NB. Index of digit in Plex/Torque/Warp, 0/1/2
region =: REGIONNAMES pick~ regionidx     NB. Name of region in which digit resides
planet =: PLANETNAMES pick~ ]             NB. Corresponding planet
