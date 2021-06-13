NB. The International Telegraph Alphabet v. 2 (currently just the letters)
itaraw =: ". >cutopen noun define
32 0 0 1 0 0
97 1 1 0 0 0
98 1 0 0 1 1
99 0 1 1 1 0
100 1 0 0 1 0
101 1 0 0 0 0
102 1 0 1 1 0
103 0 1 0 1 1
104 0 0 1 0 1
105 0 1 1 0 0
106 1 1 0 1 0
107 1 1 1 1 0
108 0 1 0 0 1
109 0 0 1 1 1
110 0 0 1 1 0
111 0 0 0 1 1
112 0 1 1 0 1
113 1 1 1 0 1
114 0 1 0 1 0
115 1 0 1 0 0
116 0 0 0 0 1
117 1 1 1 0 0
118 0 1 1 1 1
119 1 1 0 0 1
120 1 0 1 1 1
121 1 0 1 0 1
122 1 0 0 0 1
)

idxoffirst =: [ i.M.~ [: {."1 ]
gbf =: [:}.idxoffirst{]
getbyfirst =: gbf"(0 2)
letterstobits =: a.&i.@[ getbyfirst ]
ita =: itaraw letterstobits~ ]
itabits =: ,@ita
