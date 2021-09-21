require 'physicshelpers.ijs'

coriolisaccel =: 4 : '_2 * (0 0 , x) cross y' NB. omega verb v. vector coriolis accel (z along axis)
centrifugalaccel =: *:@[*] NB. omega verb r. magnitude of centrifugal accel
