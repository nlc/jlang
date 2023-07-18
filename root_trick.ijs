NB. Demonstration of how surprisingly few options for cube/fourth/etc. roots there are in a range
NB. Inspired by a demonstration of lightning root extraction by Shakuntala Devi

enrange =: [: ". ('x';"0'09') rxrplc"1 ]
possroots =: [: ({. + i.@-~/) [: >. [ %: enrange
