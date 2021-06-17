NB. noodling around with controlling an openscad instance with J
require 'format/printf'

NB. The name of the file to be opened for the interactive OpenSCAD session.
NB. OpenSCAD sources on save by default so affecting the instance is as easy
NB. as writing to the source file.
scriptfilename =: 'test.scad'

setwrite =: 1 : 'y(1!:2)<,m'
write =: scriptfilename setwrite

sphere =: 'sphere(%f);'&sprintf
cylinder =: 'cylinder(%f,%f,%f,center=true);'&sprintf NB. center by default, personal preference
cube =: 'cube([%f,%f,%f],center=true);'&sprintf NB. center by default, personal preference

single3dvectorarg =: 1 : '(m , ''([%f,%f,%f]){ %s }; '') sprintf (;/ x) , < y'
NB. translate =: 4 : '''translate([%d,%d,%d]){ %s }'' sprintf (;/ x) , < y'
translate =: 'translate' single3dvectorarg
scale =: 'scale' single3dvectorarg
mirror =: 'mirror' single3dvectorarg
rotate =: 'rotate' single3dvectorarg

NB. ,/ 3&#&.< sphere 3

NB. TODO: Multiple-expression modifiers like Union/Difference/Minkowski/etc.

NB. TODO: iteration. hmmmmmmm. using "for_ijk." maybe?
NB. 3 : 0'' NB. example
NB.   for_ijk. 0.5 + i.3 do.
NB.     smoutput 'bravo' ; ijk ; ijk_index
NB.   end.
NB. )

