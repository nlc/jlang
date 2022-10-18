NB. https://web.archive.org/web/20221018000217/https://old.reddit.com/r/Decoders/comments/y64tuw/my_boss_uses_codes_to_hint_at_future_drills/

line1 =: ". ('00';'16b') rxrplc tolower '00DD 00D9 00DD 00D3 00CB 00CD 00CC 00DF 00D2 00D9 00F8 00EF 00ED 00EF 00F0 00F7'
line2 =: ". ('00';'16b') rxrplc tolower '00DD 00D9 00DC 00DD 00F4 00EF 00E9 00F3 00CB 00CC 00B1 00A8 00B7 00BD 00D9 00BF'
line3 =: ". ('00';'16b') rxrplc tolower '00EF 00F2 00DD 00CE 00DB 00C9 00CD 00DF 00DA 00DB 00CC 00C7 00F2'
line4 =: ". ('00';'16b') rxrplc tolower '00EE 00F2 00DB 00DA 00DA 00DA 00DD 00CC 00D7 00CA 00DB 00DD 00D1 00D3 00D3 00CB 00D2 00D7 00DD 00DF 00CC 00D7 00D1 00D2 00DA 00CE 00D1 00D3 00D1 00CD 00D4 00CC 00D1 00DD 00D1 00D2 00D2 00F2'
line5 =: ". ('00';'16b') rxrplc tolower '00ED 00F2 00CD 00CB 00DD 00DD 00DB 00CD 00CD 00DA 00CB 00D4 00CC 00CE 00DF 00D7 00D2 00D7 00D2 00D9 00DA 00D1 00CE 00CC 00D8 00DB 00DD 00CE 00DB 00C9'

decrypt =: 33 pick [: { &a.&.> [: {  127 | (i.127) (+"0 1) 127 - 127 AND ]

echo > decrypt each line1 ; line2 ; line3 ; line4 ; line5

