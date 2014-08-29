rm(dataset)
setwd("data/vsc/test7/m/")
 
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
pcnewnew <- dataset[["PCNewNew.length"]]
dagify <- dataset[["D.length"]]

compression <- 1- fcnewnew / uncompressed

dcompression <- 1- dagify / uncompressed

pccompression<- 1- pcnewnew/ uncompressed

summary(compression)

summary(dcompression)

summary(pccompression)