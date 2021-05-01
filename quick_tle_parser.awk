function checksum(line) {
  digits = gensub(/-/, "1", "g", substr(line, 1, 68));
  digits = gensub(/[^0-9]/, "", "g", digits);

  sum = 0;
  for(i = 1; i <= 68; i++) {
    sum += substr(digits, i, 1);
  }

  return sum % 10;
}

BEGIN {
  line0fw = "24";
  line1fw = "2 5 2 2 3 4 2 13 11 9 9 2 4 1";
  line2fw = "2 7 8 9 8 9 9 11 5 1"

  linetype = 0;

  FIELDWIDTHS = line0fw;
}

# Skip empty lines
length($0) < 1 {
  next;
}

linetype == 0 {

  printf("\033[1m%s\033[0m\n", $1);
}

linetype == 1 || linetype == 2 {
  for(i = 1; i < NF; i++) {
    if(i % 2 == 0) {
      printf("\033[34m");
    } else {
      printf("\033[35m");
    }
    printf("%s\033[0m", $i);
  }

  cs = checksum($0);
  if(cs == $NF) {
    printf("\033[32m");
  } else {
    printf("\033[31m");
  }
  printf("%s\033[0m", $NF);

  printf("\n");
}

# Crude state machine
linetype == 0 {
  linetype = 1;
  FIELDWIDTHS = line1fw;
  next;
}
linetype == 1 {
  linetype = 2;
  FIELDWIDTHS = line2fw;
  next;
}
linetype == 2 {
  linetype = 0;
  FIELDWIDTHS = line0fw;
  next;
}
