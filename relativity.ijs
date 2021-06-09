NB. NB. Relativistic gamma factor (ugly)
NB. gamma =: [: % [: %: [: 1&- *:

NB. Use under adverb responsibly
gamma =: [: % 1&-&.*:

NB. make a nice plot with
NB. require 'plot'
NB. plot <"1|: (ivs),.gamma ivs=:%&100 i.100

NB. Energy (m E v)
E =: gamma @ ] * [: *: [ NB. Don't think this is right currently

