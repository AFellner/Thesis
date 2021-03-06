rm(dataset)
setwd("S:/Users/Andreas/Documents/studium/emcl/Wien/Thesis/R/data/vsc/test9/expl/")

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

original <- dataset[["original"]]
produced <- dataset[["produced"]]

compression <- 1 - produced/original
