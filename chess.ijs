require 'odometer.ijs'
require 'rim.ijs'

NB. Some bitboards
dark_squares =: 2|+/~i. 8
light_squares =: -. dark_squares
white_half =: 8 8 $ 32 32 # 0 1
black_half =: -. white_half
kingside =: |: 8 8 $ 32 32 # 0 1
queenside =: -. kingside
rank_1 =: 8 8 $ 56 8 # 0 1
rank_2 =: 1 |. rank_1
rank_3 =: 2 |. rank_1
rank_4 =: 3 |. rank_1
rank_5 =: 4 |. rank_1
rank_6 =: 5 |. rank_1
rank_7 =: 6 |. rank_1
rank_8 =: 7 |. rank_1
file_a =: |: rank_8
file_b =: |: rank_7
file_c =: |: rank_6
file_d =: |: rank_5
file_e =: |: rank_4
file_f =: |: rank_3
file_g =: |: rank_2
file_h =: |: rank_1
white_pieces =: 8 8 $ 48 16 # 0 1 NB. starting configuration
black_pieces =: 8 8 $ 16 48 # 1 0
w_a_pawn =: file_a AND rank_2
w_b_pawn =: file_b AND rank_2
w_c_pawn =: file_c AND rank_2
w_d_pawn =: file_d AND rank_2
w_e_pawn =: file_e AND rank_2
w_f_pawn =: file_f AND rank_2
w_g_pawn =: file_g AND rank_2
w_h_pawn =: file_h AND rank_2
b_a_pawn =: file_a AND rank_7
b_b_pawn =: file_b AND rank_7
b_c_pawn =: file_c AND rank_7
b_d_pawn =: file_d AND rank_7
b_e_pawn =: file_e AND rank_7
b_f_pawn =: file_f AND rank_7
b_g_pawn =: file_g AND rank_7
b_h_pawn =: file_h AND rank_7
w_pawns =: w_a_pawn OR w_b_pawn OR w_c_pawn OR w_d_pawn OR w_e_pawn OR w_f_pawn OR w_g_pawn OR w_h_pawn
b_pawns =: b_a_pawn OR b_b_pawn OR b_c_pawn OR b_d_pawn OR b_e_pawn OR b_f_pawn OR b_g_pawn OR b_h_pawn

moves_at_square =: 1 : '(<"1 m +"(1) y)'
knights_moves =: ,/ (<:@+:@odometer 2 2) *"1/ (,.|.) 1 2
knights_moves_at_square =: knights_moves moves_at_square

NB. location on board (with 2-square border)
(< 2 2) ="0 {;~ i. 12

NB. Possible knight's moves from the top left square
NB. this can almost certainly be done with "e."
current_possible_moves =: +/ (<"1 knights_moves +"(1) 2 2) ="0 2 {;~ i. 12
