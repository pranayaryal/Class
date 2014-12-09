complete <- function(directory, id=1:332)  {
  files_list <- list.files(directory, full.names=TRUE)   
  tab <- data.frame() #creates an empty data frame
  dat <-data.frame()
  for (id in id) {                                 
    tab <- read.csv(files_list[id])
    comp <- complete.cases(tab)
    nobs <-sum(comp)
    dat <- rbind(dat,data.frame(id,nobs))
    }
   print(dat)
    
  }
  
