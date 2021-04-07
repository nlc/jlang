roll =: monad def '>: ? y # 6'

petals =: +/@(-*)@(*2&|)

NB. (,: petals) roll 5

NB. (<@petals , <) roll 5 NB. Nicer with boxing

NB. echo (petals "1) 200 5 $ roll 1000
NB. exit 0
