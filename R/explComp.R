data  <-read.csv("data/explComp/explComp3.csv", header=TRUE)
data2 <-read.csv("data/explComp/explComp6.csv", header=TRUE)

original <- data[["original"]]
pT <- data[["proofTree"]]

better <- 1 - pT/original

summary(better)

length(better)

original2 <- data2[["original"]]
pT2 <- data2[["proofTree"]]
origsize <- data2[["origSize"]]
ptsize <- data2[["pTsize"]]

bettersize <- 1- ptsize/origsize

summary(bettersize)

plot(	origsize,
	ptsize, 
	main = "Prood production lengths", 
	xlab ="original proofs",
	ylab ="produced proofs",
	xlim =c(0,500),
	ylim =c(0,500) )