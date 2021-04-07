NB. 0 - Multiplicity
sol0 =: [: +/ =
'h' sol0 'fhqwhgads' NB. => 2

NB. 1 - Trapeze Part
sol1 =: -:|.
sol1 'madamimadam' NB. => 1
sol1 'string' NB. => 0

NB. 2 - Duplicity
uniq =: # ~ ~: NB. unique elements in order
hist =: [: +/"1 = NB. counts of unique elements in order
hgt1 =: 1 < hist NB. which unique elements appear more than once
sol2 =: hgt1 # uniq
sol2 'applause' NB. => 'ap'

NB.  3 - Sort Yourself Out
sol3 =: sort@[ -: sort@] NB. where sort is predefined as '/:~ :/:'
'listen' sol3 'silent' NB. => 1
'apple' sol3 'pale' NB. => 0

NB. 4 - Precious Snowflakes
heq1 =: 1 = hist
sol4 =: heq1 # uniq
sol4 'somewhat heterogenous' NB. => 'mwa rgnu'
sol4 'aaabccddefffgg' NB. => 'be'

NB. 5 - Musical Chars
rots =: ([: i. [: # ]) (|."0 1)]
reqs =: -:"1[:rots]
sol5 =: [: +/ reqs
'foobar' sol5 'barfoo' NB. => 1
'fboaro' sol5 'foobar' NB. => 0
'abcde' sol5 'deabc' NB. => 1

NB. 6 - Size Matters
sol6 =: [: > [: , [: }."1 [: sort (,.~# each) NB. sort=:/:~:/: each=&.>
sol6 'books' ; 'apple' ; 'peanut' ; 'aardvark' ; 'melon' ; 'pie'

NB. 7 - Popularity Contest
heqg =: [: (=[: >./ ]) hist
sol7 =: heqg # uniq NB. to make this return only one, just take the first
sol7 'abdbbac' NB. 'b'
sol7 'CCCBBBAA' NB. 'CB'

NB. 8 - esreveR A ecnetneS
space =: space =: [ , ' ' , ]
NB. ; , (cutopen s) ,. (<' ')
join =: : ; [: , (<' ') ,.~ cutopen
words =: cutopen :.join
sol8 =: |.&.>&.:words

NB. 9 - Compression Session
sol9 =: #~
'embiggener' sol9 0 0 1 1 1 1 0 0 1 1 NB. 'bigger'

NB. 10 - Expansion Mansion TODO
NB. Maybe by getting the indices of the non-blanks...?

NB. 11 - C_ns_n_nts TODO
isvowel =: 'aeiouy' e.~ ]
isconsonant =: [: -. isvowel

NB. 12 - Cnsnnts Rdx
sol12 =: #~ consonants
sol12 'Several normal words' NB. Svrl nrml wrds

NB. 13 - TITLE REDACTED
wordmatch =: ([:<[) -:"0 [: words ]
