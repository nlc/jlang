subglyphs =: ' ' , (16 + i. 11) { a.

mash =: (#@] ?@$~ 2#[){]

echo 3 mash subglyphs
md5 =: 15&(128!:6)

hash =: [: ". '0X' , 8 {. toupper@md5

convert =: [: (9&{.&.|.) 12 #.^:_1 hash

md5glyph =: 3 3 $ subglyphs {~ convert
