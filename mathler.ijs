cs =: '0123456789+-*/'
all =: cs {~ odometer 6 # 14

attempt =: 3 : 0
try.
  ". y
catch.
  __
end.
)

results =: attempt"1 all

histogram =: <:@(#/.~)@(i.@#@[ , I.) NB. https://code.jsoftware.com/wiki/Essays/Histogram

hist =: (i. 200) histogram  (, results ~: __) # results

require 'plot'
plot ^. 0.000000000001 +  hist
