require 'format/printf'

cos_rad =: 2&o.
cos_deg =: 2 o. 1r180p1&*
tan_rad =: 3&o.
tan_deg =: 3 o. 1r180p1&*

Note 'V'
   V equals one-third the sum
   Sum of a hundred and one
   And eighty-three over five
)

V =: 1r3 * 101 + 83r5

Note 'N'
   N is the product of V
   V and the cosine(?) of three
   Cube that(?) and add forty-four

   First ambiguity: Three degrees or three radians?
)

N_rad =: 44 + (V * cos_rad 3) ^ 3
N_deg =: 44 + (V * cos_deg 3) ^ 3
N =: N_rad , N_deg

Note 'X'
   X by(?) the tangent(?) of N
   [N/and] minus pi over 10(???)
   That equals negative nine

   Most ambiguous line
)

X_rad_a =: (tan_rad N_rad) * 1r10p1 - 9
X_rad_b =: _9 * (tan_rad N_rad) - 1r10p1
X_rad_c =: _9 * tan_rad N_rad - 1r10p1
X_deg_a =: (tan_deg N_deg) * 1r10p1 - 9
X_deg_b =: _9 * (tan_deg N_deg) - 1r10p1
X_deg_c =: _9 * tan_deg N_deg - 1r10p1
X =: X_rad_a , X_rad_b , X_rad_c , X_deg_a , X_deg_b , X_deg_c

Note 'Y'
   Y equals X over five
   Five to the power of xi
   Xi is the square root of three
)

Y_rad_a =: X_rad_a % 5 ^ %: 3
Y_rad_b =: X_rad_b % 5 ^ %: 3
Y_rad_c =: X_rad_c % 5 ^ %: 3
Y_deg_a =: X_deg_a % 5 ^ %: 3
Y_deg_b =: X_deg_b % 5 ^ %: 3
Y_deg_c =: X_deg_c % 5 ^ %: 3
Y =: Y_rad_a , Y_rad_b , Y_rad_c , Y_deg_a , Y_deg_b , Y_deg_c

'V = %j' printf < V
'N = %j' printf < N
'X = %j' printf < X
'Y = %j' printf < Y

Note 'Outcome'
  On a cursory glance Y_deg_a seems like the cleanest answer (~10.3)
  It would also correspond to a layman's default use of degrees over radians,
  and the simplest interpretation of the X line, i.e. (X/tanN) - (pi/10) = -9
)

exit 1
