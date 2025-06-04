raw =: 0 : 0
int o29_code[] = {
		ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR, /* control */
		ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR, /* chars   */
		ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR, /* control */
		ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR, /* chars   */
		00000,02202,00006,00102,02102,01042,04000,00022, /*  !"#$%&' */
		04022,02022,02042,04012,01102,02000,04102,01400, /* ()*+,-./ */
		01000,00400,00200,00100,00040,00020,00010,00004, /* 01234567 */
		00002,00001,00202,02012,04042,00012,01012,01006, /* 89:;<=>? */
		00042,04400,04200,04100,04040,04020,04010,04004, /* @ABCDEFG */
		04002,04001,02400,02200,02100,02040,02020,02010, /* HIJKLMNO */
		02004,02002,02001,01200,01100,01040,01020,01010, /* PQRSTUVW */
		01004,01002,01001,04202,02006,01202,04006,01022, /* XYZ[\]^_ */
		ERROR,04400,04200,04100,04040,04020,04010,04004, /* `abcdefg */
		04002,04001,02400,02200,02100,02040,02020,02010, /* hijklmno */
		02004,02002,02001,01200,01100,01040,01020,01010, /* pqrstuvw */
		01004,01002,01001,ERROR,ERROR,ERROR,ERROR,ERROR  /* xyz{|}~  */
	};
)

codes_029 =: , > ". each ((' *\b0';' 8b0')rxrplc ])each (('ERROR';'0')rxrplc ])each ((' $';'')rxrplc ])each ((', *';' ')rxrplc ])each (('\t|/\*.*';'')rxrplc ])each }: }. cutLF raw NB. I'm so sorry
ord =: a.&i.

encode_029 =: (12 # 2) #: codes_029 {~ ord

lines =: cutLF fread 'prisoner_intro.txt'
encoded =: (] ,"1 0 i.@{.@$) > (encode_029 ,"1 0 ord) each lines

NB. 'prisoner_intro_punch_card_data.csv' fwrite~ ('^ *';'') rxrplc ,(LF ,~ ('  *';',') rxrplc ])"1 ": encoded
NB. 'prisoner_intro_punch_card_data.csv' fwrite~ ('A,B,C,D,E,F,G,H,I,J,K,L,ascii,cardidx' , LF) , ('^ *';'') rxrplc ,(LF ,~ ('  *';',') rxrplc ])"1 ": encoded

enc =: 12 {."1 encoded
dim =: $ enc
'prisoner_intro_punch_card_data_3d.csv' fwrite~ ('^ *,| *$';'') rxrplc"1 (LF ,~ ('  *';',') rxrplc ])"1 ": > (,enc) # , dim&#: each (({"0)@i.) dim
