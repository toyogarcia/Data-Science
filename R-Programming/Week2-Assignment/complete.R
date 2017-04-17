complete <- function(directory, id=1:332){
###################################################################
# Program: complete.R
# Parameters:
#   directory -> Path to the files
#   id        -> Files to return the number of complete cases
# Sample call:
#   complete("C:/Coursera/Data Science/2.- R Programming/Week 2/Exercises/specdata",30:25)
###################################################################
    
    # return the list of directory files
    fileList <- list.files(directory, full.names = TRUE)
    # intialize data frame to store the id and obs
    totFileCC <- data.frame()
    
    # loop through the files
    for (i in id){
        # read the file
        fileData  <- read.csv(fileList[i])
        # get complete cases
        compCases <- fileData[complete.cases(fileData), ]
        # add row with id and obs to the data frame
        totFileCC <- rbind(totFileCC, c(i,nrow(compCases)))
    }
    
    # names the data frame columns
    names(totFileCC) = c('id', 'nobs')
    # returns the data frame
    totFileCC
}