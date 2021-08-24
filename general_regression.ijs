require './linear_regression.ijs'

NB. reduce under the assumption that the data is of the form
NB.   'noise + u x'
NB. and that the underlying function is adequately described by two parameters
gr =: 1 : 'u (x lr u^:_1 y) p. x'
gr2 =: 1 : 'u (x lr v y) p. x' NB. explicitly specify v <-> u^:_1

NB. require 'plot'
NB. is =: 30 %~ i. 30 NB. indices
NB. noise =: 0.2 * ? (# is) # 0
NB. data =: noise + ^ is
NB. exp_regress =: ^ gr
NB. lin_regress =: ] gr
NB. plot data , (is exp_regress data) , (is lin_regress data) , (is (^&3 gr) data) ,: (is (^&17 gr) data)
NB. exit 0
