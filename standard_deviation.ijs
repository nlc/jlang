mean =: +/%#

NB. Standard Deviation of SAMPLE
sds =: [:(+/%<:@#)&.:*:(-mean)

NB. Standard Deviation of POPULATION
sdp =: [:(+/%#)&.:*:(-mean)
