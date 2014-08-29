data  <-read.csv("data/vsc/ac-fc-pc_new_exp1.csv", header=TRUE)

//data  <-read.csv("data/seq_noHuge_37.csv.csv", header=TRUE)

uncompressed <- data[["Uncompressed.length"]]

//congruence <- data[["FibC.length"]]

congruence <- data[["ACNew.length"]]

cnewtime <- data[["CNew.time"]]
fibCtime <- data[["FCNew.time"]]
arrayCtime <- data[["ACNew.time"]]

compression <- 1 - congruence /uncompressed
avgcomp <- mean(compression)
maxcomp <- max(compression)

avglength <- mean(uncompressed)

cnewSpeed <- uncompressed/cnewtime 
fibCspeed <- uncompressed/fibCtime
arrayCspeed <- uncompressed/arrayCtime

compression
avgcomp*100

summary(compression)