Note 'purpose'
  represent an approximate percentile in four bits (0-15),
  assuming that greater precision is needed as you get closer to 100%

  Approximate mapping:
   0   0.000-0.358
   1   0.359-0.500
   2   0.501-0.583
   3   0.584-0.645
   4   0.646-0.695
   5   0.696-0.739
   6   0.740-0.777
   7   0.778-0.811
   8   0.812-0.842
   9   0.843-0.871
  10   0.872-0.898
  11   0.899-0.923
  12   0.924-0.946
  13   0.947-0.968
  14   0.969-0.989
  15   0.990-1.000

  Note that 2 corresponds to the 50th percentile, 11 to the 90th,
  and 15 to the 99th. 6 is almost on the 75th percentile, as well.

  The obverse function is crude but could potentially be useful
)

fbpfwd =: [: <. 0.5 15 p. ^&3.32
fbpinv =: [: {.@+. ((0.5 15 p. ^&3.32))^:(_1)
fbp =: fbpfwd :. fbpinv
