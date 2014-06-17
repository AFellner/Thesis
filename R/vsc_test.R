data_in  <-read.csv("data/vsc/test5_combined.csv", header=TRUE)

//data <- data_in[data_in$"Uncompressed.length" > 100000,]
data <- data_in
//data  <-read.csv("data/seq_noHuge_37.csv", header=TRUE)

names <- data[["Proof"]]

uncompressed <- data[["Uncompressed.length"]]
uncompressedtr <- data[["Uncompressed.transLength"]]
fib <- data[["FCNewNew.length"]]
array  <- data[["ACNewNew.length"]]
ptc <- data[["PCNewNew.length"]]

fibtr <- data[["FCNewNew.transLength"]]
arraytr  <- data[["ACNewNew.transLength"]]
ptctr <- data[["PCNewNew.transLength"]]

fibtime <- data[["FCNewNew.time"]]
arraytime  <- data[["ACNewNew.time"]]
ptctime <- data[["PCNewNew.time"]]

fibtrcomp <- 1 - fibtr /uncompressedtr
arraytrcomp  <- 1 - arraytr /uncompressedtr
ptctrcomp <- 1 - ptctr /uncompressedtr

fibcomp <- 1 - fib /uncompressed
arraycomp <- 1 - array /uncompressed
ptccomp <- 1 - ptc /uncompressed


fibspeed <- uncompressed/fibtime 
arrayspeed <- uncompressed/arraytime  
ptcspeed <- uncompressed/ptctime 

1 - sum(fib)/sum(uncompressed)
1 - sum(ptc)/sum(uncompressed)

1 - sum(fibtr)/sum(uncompressedtr)
1 - sum(ptctr)/sum(uncompressedtr)

summary(fibcomp)
summary(arraycomp)
summary(ptccomp)

dd <- data.frame(fibcomp)
row_sub = apply(dd, 1, function(row) all(row !=0 ))
fibnozero <- dd[row_sub,]