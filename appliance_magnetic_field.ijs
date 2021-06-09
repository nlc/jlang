require 'convert/json'
require 'plot'

eoub =: (([:>:i.&.-:@#){])@;

NB. contentson =:  (1!:1) < 'appliance_on.json'
NB. dataon =: dec_json contentson
NB. plot < |: 128 3 ($,) >>eoub^:2 dataon

contentsoff =:  (1!:1) < 'appliance_off.json'
dataoff =: dec_json contentsoff
plot < |: 128 3 ($,) >>eoub^:2 dataoff

exit 0
