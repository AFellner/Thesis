rm(dataset)
setwd("data/vsc/test9/m/")
 
file_list <- list.files()
 
for (file in file_list){
       
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.csv(file, header=TRUE)
  }
   
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.csv(file, header=TRUE)
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
 
}

summary(dataset)

uncompressed <- dataset[["Uncompressed.length"]]
fcnewnew <- dataset[["FCNewNew.length"]]

compression <- 1- fcnewnew / uncompressed

c2 <- 1 - sum(fcnewnew) / sum(uncompressed)

summary(compression)