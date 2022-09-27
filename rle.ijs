rle =: '5o2b2o5b6o$2o2b2ob2o5b6o$2o2b2ob2o5b2o$2o2b2ob2o5b2o$2o2b2ob2o5b2o$2ob3ob2o5b4o$2ob2o2b2o5b2o$2ob2o2b2o5b2o$2o2b2ob6ob6o$2o2b2ob6ob6o!'

 > '\d*[ob]'&rxall each '$' cut rle

'\d+|[ob]'&rxall each 1 pick '\d*[ob]'&rxall each '$' cut rle

_2&{.@((<1)&,) each '\d+|[ob]'&rxall each 1 pick '\d*[ob]'&rxall each '$' cut rle

NB. Attempts to parse throw a domain error on lines that contain a single 'o' or 'b',
NB. even when a 1 is prepended. My guess is that it parses the 1s as booleans and doesn't
NB. want to mix them with numerics. Which is stupid, if true.

NB. so the below works ONLY on certain lines
('[[:space:]]' ; '') rxrplc , ((__&".@>@{. # ]@>@{:)"1) > _2&{.@((<1)&,) each '\d+|[ob]'&rxall eac h 0 pick '\d*[ob]'&rxall each '$' cut rle

NB. if and when this is figured out, the next step would be to take a boxed list of expanded
NB. lines of 1s and 0s and concatenate them in a way that preserves the original shape
