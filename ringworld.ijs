require 'format/printf'

sec2day =: %&86400
m2mi =: %&1609.344
G =: 9.81

R =: 1.4966899e11
V =: %: R * G

Om =: V % R
Th =: Om&*

falan =: sec2day Th^:(_1) 2p1

'Ringworld rotates at %f miles per second' printf m2mi V
'%f Earth days in one Ringworld rotation (falan)' printf falan

NB. A falan is only 25 minutes shy of exactly 9 days

exit 1
