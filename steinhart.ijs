NB. Data
NB. R =: 2790000 1098000 45700 NB. calibration resistances (old)

NB. FIRST PROBE
R =: 2485301.7805755395 1098000 45700 NB. calibration resistances 1
R =: 2485301.7805755395 1098000 50000 NB. calibration resistances (arduino) 1
T =: 273.15 296.48 373 NB. calibration temperatures 1

NB. SECOND PROBE
R =: 2.60736e6 1.0449e6 49000 NB. calibration resistances 2
T =: 273.15 297 373 NB. calibration temperatures 2

r =: 1293721.9000000000 NB. measured resistance

NB. Helper functions
f2c =: (5%9)*_32&+
c2a =: 273.15&+
f2a =: c2a@f2c

c2f =: f2c^:_1
a2c =: c2a^:_1
a2f =: f2a^:_1

NB. Verbose version
NB. row =: verb def '1&,(],^&3)^.y'
NB. shmat =: verb def 'row"0,/y'
NB. k =: (%. shmat R) (+/ . *) (% T)
NB. t =: % (row r) (+/ . *) k

NB. Less verbose version
calibrate =: dyad def '(%.1&,@(],^&3)"0^.x)(+/ . *)%y'
echo k =: R calibrate T
temperature =: dyad def '%(1&,(],^&3)^.y)(+/ . *)x'
echo a2f t =: k temperature r
