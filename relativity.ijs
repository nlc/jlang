NB. Beta--fraction of speed of light
speedoflight_ms =: 299792458 NB. m*s^_1
speedoflight2_ms =: *: speedoflight_ms
beta_ms =: %&speedoflight_ms

NB. NB. Relativistic gamma factor (ugly)
NB. gamma =: [: % [: %: [: 1&- *:

NB. Use under adverb responsibly
gammafrac =: [: % -.&.*:
gamma_ms =: gammafrac@beta_ms

NB. NB. make a nice plot with
NB. require 'plot'
NB. plot <"1|: (ivs),.gamma ivs=:%&100 i.100
NB. exit 3

NB. Energy (m E v)
NB. Etotal = gamma * m * c^2
E =: speedoflight2_ms*[*gamma_ms@]
