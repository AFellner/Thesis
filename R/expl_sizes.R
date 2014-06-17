data  <-read.csv("data/vsc/test5-proofs_combined.csv", header=TRUE)
 //, colClasses = "logical")

original <- data[["original"]]
produced <- data[["produced"]]
theorylemma <- data[["theorylemma"]]

comp <- 1 - produced/original

dd <- data.frame(comp)
row_sub = apply(dd, 1, function(row) all(row !=0 ))
compnozero <- dd[row_sub,]

tl <- data.frame(theorylemma)
istl = apply(dd, 1, function(row) all(isTRUE(row)))
tls <- tl[istl,]