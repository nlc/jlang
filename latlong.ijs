dms2sec =: 60&#.@x:
dms2deg =: 3600 %~ dms2sec
deg2rad =: 1r180p1&*
rad2deg =: deg2rad^:_1
dms2rad =: deg2rad@dms2deg

NB. offsetstoruns =: ],.,&_@(}.-}:)
NB. (]($,)~[:|.1&,@$) |: otr 0 2 4 9

NB. (3 2 1 ($,) (otr 0 2 4)) ];.0"(2 1) 'quickbrownfox'

NB. Example file
datafilename =: 'ks_position_data.txt' NB. generated using 'extract_position_data.sh'
dataraw =: cutopen fread datafilename

NB. NB. 'AJ3333 40 31 41.     (N) 078 21 49.     (W) SCALED' NB. obsolete
NB. selector =: (0 ,: 6) , (6 ,: 15) , (25 ,: 15) ,: (44 ,: 8)
NB. ' KE0637* NAD 83(1986) POSITION- 39 06 56.     (N) 095 07 17.     (W)   SCALED    '
selector =: (1 ,: 6) , (31 ,: 15) , (50 ,: 15) ,: (71 ,: 10)
data =: > selector&(<;.0) each dataraw
echo data

NB. Haversine formula
EarthRadius =: 6.3781e6
NB. phi{1,2} are the latitudes of point 1 and 2 in radians
NB. lambda    """    longitudes           """
NB. d = 2r arcsin( sqrt( sin2( phi2 - phi1 ) + cos( phi1 ) cos( phi2 ) sin2( lambda2 - lambda1 / 2 ) ) )
sin =: 1 o. ]
cos =: 2 o. ]
asin =: _1 o. ]
sin2 =: [:*:[:sin]
atan2 =: 12 o. j.
hdist =: 4 : 0
'lat1 lon1' =: x
'lat2 lon2' =: y
+: EarthRadius * asin %: (sin2 -: lat2 - lat1) + (cos lat1) * (cos lat2) * sin2 -: lon2 - lon1
)

NB. NB. test
NB. Chicago =: deg2rad 41.881832 87.623177
NB. KansasCity =: deg2rad 39.099724 94.578331
NB. echo Chicago hdist KansasCity NB. should be about 665000

Random1 =: dms2rad"(1) 2 3 $ 38 50 12.4 94 40 15.1
Random2 =: deg2rad 38.93547296631799 94.67563079788061
Random3 =: deg2rad 38.924123593913286 94.72772958797651
echo 10 {. sort Random1 hdist"1/ dms2rad@". each 1 2 {"1 data
echo 10 {. sort Random2 hdist"1/ dms2rad@". each 1 2 {"1 data
echo 10 {. sort Random3 hdist"1/ dms2rad@". each 1 2 {"1 data

NB. forward azimuth
azimuth =: 4 : 0
'lat1 lon1' =: x
'lat2 lon2' =: y
- (((cos lat1) * (sin lat2)) - ((sin lat1) * (cos lat2) * (cos lon2 - lon1))) atan2 ((sin lon2 - lon1) * cos lat2)
)

actual =: dms2rad 105 37 40

NB. temp, print all
require 'format/printf'
(9!:37)0 256 0 1000000
NB. '%f,-%f' printf> 1.0&*@dms2deg@". each 1 2 {"1 data
require 'plot'
'point' plot |. ;/ |: 1 _1 *"1 > 1.0&*@dms2deg@". each 1 2 {"1 data
exit 3
