subglyphs =: ' ' , (16 + i. 11) { a.
hsubglyphs =: 0 3 2 1 6 5 4 9 8 7 10 11 { subglyphs
vsubglyphs =: 0 7 8 9 4 5 6 1 2 3 10 11 { subglyphs

NB. Mirror horizontal: 0 3 2 1 6 5 4 9 8 7 10 11
NB. Mirror vertical: 0 7 8 9 4 5 6 1 2 3 10 11

mash =: (#@] ?@$~ 2#[){]

NB. echo test =: 3 mash subglyphs
md5 =: 15&(128!:6)

hash =: [: ". '0X' , 8 {. toupper@md5

convert =: [: (9&{.&.|.) 12 #.^:_1 hash

md5glyph =: 3 3 $ subglyphs {~ convert

hreverse =: |."1
hmirror =: hsubglyphs {~ subglyphs i. ]
vreverse =: |.
vmirror =: vsubglyphs {~ subglyphs i. ]

hflip =: hreverse@hmirror
vflip =: vreverse@vmirror

quad =: (,"1 hflip)@(,vflip)

echo quad 5 mash subglyphs

NB. neat: quad 2 3 mash subglyphs
