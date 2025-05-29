Note 'Attribution'
  CC BY-SA-4.0
  Copied wholesale for use as a utility, from
  https://code.jsoftware.com/wiki/Essays/Levenshtein_Distance.
  Original code by Roger Hui and Henry Rich.
)

LevenshteinMatrix=: 4 : 0
  d=. (1+(#x),#y)$0
  for_i. i.1+#x do. d=. i (<i,0)}d end.  NB. deletion
  for_j. i.1+#y do. d=. j (<0,j)}d end.  NB. insertion
  for_j. i.#y do.
    for_i. i.#x do.
      if. (i{x) = j{y do.
        d=. d (<1+i,j)}~ (<i,j){d
      else.
        m=.      1 + (<i,1+j){d             NB. deletion
        m=. m <. 1 + (<(1+i),j){d           NB. insertion
        m=. m <. 1 + (<i,j){d               NB. substitution
        d=. m (<1+i,j)}d
  end. end. end.
)

lmy=: 4 : 'y,(0{x){(1+(1{x)<.{:y),2{x'

lmx=: 4 : 0
  b=. (_1+#y){x
  d=. {:y
  m=. (}.<.}:) d
  y , > lmy&.>/ (|.<"1 b,.m,.}:d),<#y
)

LM=: =/~ lmx^:(#@[) ,:@i.@>:@#@[

levdist=: 4 : 0 " 1
  'a b'=. (/: #&>)x;y
  z=. >: iz =. i.#b
  for_j. a do.
    z=. <./\&.(-&iz) (>: <. (j ~: b) + |.!.j_index) z
  end.
  {:z
)
