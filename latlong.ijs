dms2sec =: 60&#.@x:
dms2deg =: 3600 %~ dms2sec

NB. offsetstoruns =: ],.,&_@(}.-}:)
NB. (]($,)~[:|.1&,@$) |: otr 0 2 4 9

NB. (3 2 1 ($,) (otr 0 2 4)) ];.0"(2 1) 'quickbrownfox'

NB. Example file
datafilename =: 'example_marker_data.txt'
data =: cutopen fread datafilename

NB. 'AJ3333 40 31 41.     (N) 078 21 49.     (W) SCALED'
selector =: (0 ,: 6) , (6 ,: 15) , (25 ,: 15) ,: (44 ,: 8)
echo > selector&(<;.0) each data

exit 3

NB. Haversine formula
