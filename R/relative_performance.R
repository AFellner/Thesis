trc1 <-read.csv("data/TRC1_space.csv", header=TRUE)
trc2 <-read.csv("data/TRC2_space.csv", header=TRUE)
smt1 <-read.csv("data/SMT1_space.csv", header=TRUE)
smt2 <-read.csv("data/SMT2_space.csv", header=TRUE)

avg_trc1 = rowMeans(trc1[,c(2:length(trc1))])
avg_trc2 = rowMeans(trc2[,c(2:length(trc2))])
avg_smt1 = rowMeans(smt1[,c(2:length(smt1))])
avg_smt2 = rowMeans(smt2[,c(2:length(smt2))])

bu_names_big <- c("LastChild","Children")
td_names_big <- c("LastChildTD","ChildrenTD")

bu_names_small <- c("LastChild","Children","Distance1BU","Distance3BU","LCllavg","LClhavg","LChlavg","LChhavg","LCllmax","LClhmax","LChlmax","LChhmax")
td_names_small <- c("LastChildTD","ChildrenTD","Distance1","Distance3")

min_trc1_bu = do.call(pmin, as.data.frame(trc1[,bu_names_small]))
min_trc2_bu = do.call(pmin, as.data.frame(trc2[,bu_names_big]))
min_smt1_bu = do.call(pmin, as.data.frame(smt1[,bu_names_big]))
min_smt2_bu = do.call(pmin, as.data.frame(smt2[,bu_names_small]))

min_trc1_td = do.call(pmin, as.data.frame(trc1[,td_names_small]))
min_trc2_td = do.call(pmin, as.data.frame(trc2[,td_names_big]))
min_smt1_td = do.call(pmin, as.data.frame(smt1[,td_names_big]))
min_smt2_td = do.call(pmin, as.data.frame(smt2[,td_names_small]))


collect_all <- function(heuristic) {
  print(c(trc1[[heuristic]],smt2[[heuristic]],trc2[[heuristic]],smt1[[heuristic]]))
}
collect_small <- function(heuristic) {
  print(c(trc1[[heuristic]],smt2[[heuristic]]))
}

sink("NUL")

bu_min <- c(min_trc1_bu,min_smt2_bu,min_trc2_bu,min_smt1_bu)
td_min <- c(min_trc1_td,min_smt2_td,min_trc2_td,min_smt1_td)

m <- matrix(c(bu_min,td_min),ncol=2,nrow = length(bu_min))
overall_min <- do.call(pmin, as.data.frame(m))

length_big <- collect_all("Length")

allmeans = c(avg_trc1, avg_smt2, avg_trc2, avg_smt1)
smallmeans = c(avg_trc1,avg_smt2)


lc_bu <- collect_all("LastChild")
ch_bu <- collect_all("Children")
lc_td <- collect_all("LastChildTD")
ch_td <- collect_all("ChildrenTD")
d1_bu <- collect_small("Distance1BU")
d3_bu <- collect_small("Distance3BU")
d1_td <- collect_small("Distance1")
d3_td <- collect_small("Distance3")
llavg <- collect_small("LCllavg")
lhavg <- collect_small("LClhavg")
hlavg <- collect_small("LChlavg")
hhavg <- collect_small("LChhavg")
llmax <- collect_small("LCllmax")
lhmax <- collect_small("LClhmax")
hlmax <- collect_small("LChlmax")
hhmax <- collect_small("LChhmax")
lc_bu_small <- collect_small("LastChild")

perf_lc_bu <- mean(1-(lc_bu/allmeans ))
perf_ch_bu <- mean(1-(ch_bu/allmeans ))
perf_lc_td <- mean(1-(lc_td/allmeans ))
perf_ch_td <- mean(1-(ch_td/allmeans ))

perf_d1_bu <- mean(1-(d1_bu/smallmeans ))
perf_d3_bu <- mean(1-(d3_bu/smallmeans ))
perf_d1_td <- mean(1-(d1_td/smallmeans ))
perf_d3_td <- mean(1-(d3_td/smallmeans ))

perf_llavg <- mean(1-(llavg /lc_bu_small ))
perf_lhavg <- mean(1-(lhavg /lc_bu_small ))
perf_hlavg <- mean(1-(hlavg /lc_bu_small ))
perf_hhavg <- mean(1-(hhavg /lc_bu_small ))
perf_llmax <- mean(1-(llmax /lc_bu_small ))
perf_lhmax <- mean(1-(lhmax /lc_bu_small ))
perf_hlmax <- mean(1-(hlmax /lc_bu_small ))
perf_hhmax <- mean(1-(hhmax /lc_bu_small ))

decay_vector <-c(perf_llavg,perf_lhavg,perf_hlavg,perf_hhavg,perf_llmax,perf_lhmax,perf_hlmax,perf_hhmax)
decay_names <- c("llavg","lhavg","hlavg","hhavg","llmax","lhmax","hlmax","hhmax")

decay_rounded <- format(round(decay_vector*100,2),nsmall=2)

decay <- data.frame(decay_rounded)
row.names(decay) <- decay_names

sink()

perfs_raw <- c(perf_lc_bu, perf_ch_bu, perf_lc_td, perf_ch_td, perf_d1_td, perf_d1_bu, perf_d3_td, perf_d3_bu)
perfs <- format(round(perfs_raw*100,2),nsmall=2)
perfs_name <- names(trc1)[c(2:9)]
df <- data.frame(perfs)
row.names(df) <- perfs_name
print(df)
print(decay)
#plot(bu_min~td_min)
t <- title(main="main title", sub="sub-title", 
  	 xlab="x-axis label", ylab="y-axis label")
plot(length_big,bu_min,t)

plot(length_big,overall_min, )

plot(	length_big,
	overall_min, 
	main = "", 
	xlab ="Proof length",
	ylab ="Best space measure",
	xlim =c(0,2000000),
	ylim =c(0,20000))

plot(	bu_min,
	td_min, 
	main = "", 
	xlab ="Best Bottom-Up result",
	ylab ="Best Top-Down result",
	xlim =c(0,15000),
	ylim =c(0,15000),
	pch= 3)

plot(smt1)