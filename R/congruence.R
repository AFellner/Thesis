data  <-read.csv("data/seq_test.csv", header=TRUE)

data

uncompressed <- data[["Uncompressed.length"]]
congruence <- data[["FibC.length"]]

fibCtime <- data[["FibC.time"]]
arrayCtime <- data[["ArrayC.time"]]

compression <- 1 - congruence/uncompressed
avgcomp <- mean(compression)
maxcomp <- max(compression)

avglength <- mean(uncompressed)

fibCspeed <- uncompressed/fibCtime
arrayCspeed <- uncompressed/arrayCtime

compression
avgcomp*100

summary(compression)

arrayCtime - fibCtime