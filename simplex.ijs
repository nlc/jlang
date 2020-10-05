NB. The vertices, edges, faces, etc of the simplex
NB.   in a given dimension
simplex =: (>:@i.@<:!])@>: NB. old

NB. Silly me, I missed a perfect opportunity to use the under operator
simplex=:(i.&.<:!])@>:

NB. Alternating sum (made tricky by the fact that
NB.   the simple approach of gerunds is still applied
NB.   right-to-left, which I couldn't easily deal with.
+/(*1 _1$~$)
