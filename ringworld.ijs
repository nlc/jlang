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
'%f Earth days in one Ringworld rotation' printf falan

exit 1
