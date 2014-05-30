data  <-read.csv("data/seq_noHuge_17.csv", header=TRUE)

data

uncompressed <- data[["Uncompressed.length"]]
congruence <- data[["FibC.length"]]
cnew  <- data[["CNew.length"]]

cnewtime <- data[["CNew.time"]]
fibCtime <- data[["FibC.time"]]
arrayCtime <- data[["ArrayC.time"]]

compression <- 1 - cnew  /uncompressed
avgcomp <- mean(compression)
maxcomp <- max(compression)

avglength <- mean(uncompressed)

cnewSpeed <- uncompressed/cnewtime 
fibCspeed <- uncompressed/fibCtime
arrayCspeed <- uncompressed/arrayCtime

compression
avgcomp*100

summary(compression)

arrayCtime - fibCtime