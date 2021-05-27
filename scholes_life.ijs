NB. https://www.youtube.com/watch?v=a9xAKttWgP4

NB. The following is the script of the linked video. The transcript is
NB. contained in the comments, while the SLOC are an approximate J translation
NB. of the given APL.

NB. ===========================================================================

NB. Here is a vector of the first nine natural numbers.
i. 9

NB. The 3x3 reshape gives us a three row, three column matrix.
3 3 $ i. 9 NB. OR
i. 3 3

NB. Which of the items of the matrix are members of this vector? 1 for yes, 0
NB. for no, and we'll call this boolean matrix "r".
r =: 1 2 3 4 7 e.~ i. 3 3

NB. We can embed "r" in a slightly larger matrix, the 5-by-7 take of "r", which
NB. pads below and on the right with zeros...
5 7 {. r

NB. ...and we can center our original within this by doing the _2 rotate
NB. around a vertical axis and the _1 rotate around a horizontal axis, and
NB. we'll call this larger matrix uppercase R
R =: _1 |. _2 (|."1) 5 7 {. r

NB. Here is a vector of 3 matrices...
R , R ,: R

NB. ...and we can see this more clearly if we copy in a library function,
NB. also written in APL, which draws boxes around subarrays.
disp =: <"_1 NB. No import necessary here
disp R , R ,: R

NB. The 1 by 0 by _1 rotate-each distributes the rotation between corresponding
NB. items in the left and right argument vectors, so we see our original
NB. 0-rotated in the center, with a 1- and a _1-rotation on either side.
disp 1 0 _1 (|."1)"0 2 R , R ,: R

NB. We can simplify this slightly by having just one copy of "R" which is
NB. enclosed to form a rank-0 array which is distributed to each item in the
NB. left argument vector, so we get the same result.
disp 1 0 _1 (|."1)"0 2 R NB. NOTE: Enclosure unnecessary

NB. Next we'll do the 1 by 0 by _1 outer product column rotation--and outer
NB. product takes each item of the left argument and distributes a function
NB. between it and each item of the right argument--so we get a table or a
NB. matrix, in this case a 3 by 3 matrix, with our original in the center
NB. surrounded by all possible 1-rotations.
disp 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 R NB. NOTE: could be better

NB. And if we do a column sum of the 3 by 3 matrix we get a 3-vector...
disp +/ 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 R

NB. ...and if we sum the vector we see a neighbor count for each cell in our
NB. original matrix "R"...
disp +/ +/ 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 R

NB. ...and the rules of Conway's Game of Life are that we have a 1 in the
NB. following generation if the neighbor count including self is a 3 or if the
NB. neighbor count including self is a 4 and the original cell was occupied.
NB. So firstly let's find the 3s and 4s--there they are...
disp 3 4 ="0 2 +/ +/ 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 R

NB. ...and we're interested in any 3 and a 4 corresponding to an occupied
NB. cell, which is just our original matrix R, so we AND those...
disp (1 ,: R) AND 3 4 ="0 2 +/ +/ 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 R

NB. ...and both of these matrices contribute to the next generation, so if we
NB. OR them together and disclose the result we see a simple matrix for the
NB. next generation in the Game of Life.
OR/ (1 ,: R) AND 3 4 ="0 2 +/ +/ 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 R

NB. So here we have a single array expression for the next generation, and
NB. you'll notice that it contains no explicit loops and no temporary
NB. variables, and that the size of the matrix "R" is not specified anywhere,
NB. so that the expression is applicable to a matrix of any size.

NB. Let's abstract this as a function by wrapping it in curly braces and
NB. changing all occurrences of R to formal parameter omega. So this is a
NB. function, and we'll call this function "life".
NB. [NOTE: curly braces -> quotes, omega -> y]
life =: 3 : 'OR/ (1 ,: y) AND 3 4 ="0 2 +/ +/ 1 0 _1 (] .(|."0 2)"1 2) 1 0 _1 (|."1)"0 2 y'

NB. Let's test it. There are the first three generations...
disp R , (life R) ,: (life life R)

NB. ...and we can abstract this progression by making a function "gen" (for
NB. "generation") which is "life" to the power of the right argument,
NB. applied to the left argument...
gen =: 4 : '(life^:y)x'

NB. ...so "R" bound with "gen", applied to each of the first 4 numbers, gives
NB. us 4 generations.
disp R & gen i. 4

NB. Next let's make a larger arena still. So: "RR" is the 15 by 35 take of the
NB. _10 by _20 take of "R", so this is a 15 by 35 matrix of 0s and 1s, with
NB. our original "r" in the center.
RR =: 15 35 {. _10 _20 {. R

NB. And it's easier to see this if I make a corresponding array of characters,
NB. so we'll make a picture which uses a dot and a domino shape corresponding
NB. to the 0s and 1s in "RR". I'll open an edit window on this so we can see
NB. it--there we are.
]pic =: (u: 183 9017) {~ RR

NB. And now finally I'd like to make an animation of this to show this working,
NB. but first of all you might like to Google "Dyalog creature", and I'll say
NB. more about this in a moment
NB. Google: dyalog creature

NB. So to make an animation, all we have to do is to apply the "life"
NB. function under power limit to the original population--and "power limit"
NB. finds a fixed point of its operand function "life" by applying it
NB. successively to generations until the result and argument are identical.
life ^:_ RR

NB. Now I'm going to wrap this in an outer function, which is a beta
NB. abstraction. so it doesn't change anything except it gives me the
NB. opportunity of, as a side effect with a statement separator, updating our
NB. picture variable using the same characters, but this time selected by the
NB. argument of the function that is applied by the fixed-point operation, and
NB. changes in this global variable will be reflected in the edit window, so
NB. we should see it working.
gen_draw1 =: 3 : 0
  pic =: (u: 183 9017) {~ y
  echo pic
  echo ''
  life y
)

NB. Before we do so, I'll make just two small refinements: firstly, I'm not
NB. interested in the boolean result which is the fixed point, so I'll apply
NB. a null function to discard it, and secondly, to have a chance of seeing
NB. it working we need, with another statement separator, to apply a small
NB. time delay, so let's say a delay of an eighth of a second--the
NB. reciprocal of 8.
gen_draw2 =: 3 : 0
  echo 27 91 50 74 27 91 72 { a.
  pic =: (u: 183 9017) {~ y
  echo pic
  usleep 1e6 * 1r8
  life y
)
0 $ gen_draw2 ^:_ RR

NB. And there we see it running, and the way we've coded it with rotations
NB. we've produced Life on a torus--so the edges wrap--but it's easy to
NB. write simple operators that take our "life" function as an operand and
NB. the operators produce Life on other manifolds such as an infinite plane,
NB. or a Klein bottle, or a Mobius band, and if you google for "Dyalog
NB. creatures", you'll see a web page (https://dfns.dyalog.com/n_life.htm)
NB. which shows how to do this. If you're using Internet Explorer as your
NB. browser, then the APL font will download automatically, but if you
NB. have trouble or are using a different web browser, then the page
NB. contains details of how to download and install the APL font.

NB. So, there you are: Life, in APL!
