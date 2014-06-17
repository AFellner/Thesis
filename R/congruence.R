//data  <-read.csv("data/vsc/ac-fc-pc_new_exp1.csv", header=TRUE)

data  <-read.csv("data/seq_noHuge_37.csv.csv", header=TRUE)

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