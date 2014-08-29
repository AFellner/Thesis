//getmonitor <- function(id, directory, summarize = FALSE) {
//
 // filename <- list.files(pattern="specdata/.csv")
//
  //data <- read.csv( paste(directory,"/uf_40_",sprintf('%02d',id),".csv",sep="") )
 // return (data) 
//}

//test <- getmonitor(01, "data/vsc/test7/raw/m")

//summary(test)

//fcnewnew <- test[["FCNewNew.length"]]

//summary(fcnewnew)

//length(fcnewnew)

files <- list.files("data/vsc/test7/raw/m/")

data.list <- lapply(files, read.csv)

data.cat <- do.call(rbind, data.list)

summary(data)