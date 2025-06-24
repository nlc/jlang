NB. chars =: 'DIM' ; 'CET' ; 'GAL' ; 'BOP'
chars =: 'CIH' ; 'SYA' ; 'BRQ' ; 'UMP'
words =: cutLF toupper fread '../../wordlist.10000'

NB. filter words to select only those entirely composed of our chars
charsrgx1 =: '^[' , (,> chars) , ']*$'

NB. filter words to remove those that match two characters in a row from one side
strjoin=: #@[ }. <@[ ;@,. ]
charsrgx2 =: '|' strjoin ('[' , ']{2,}' ,~ ]) each chars

rgxmask =: 4 : ' 0 ~: > ([: +/ x rxE ]) each y'

candidates =: (#~ [: -. charsrgx2 rgxmask ]) (#~ charsrgx1 rgxmask ]) words

echo 10 {. sorted =: |. (/: > # each candidates) { candidates
