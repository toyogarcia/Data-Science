corr <- function(directory, thresold = 0){
###################################################################
# Program: corr.R
# Parameters:
#   directory -> path to the data files
#   thresold  -> thresold for complete cases
# Sample call:
#   corr("C:/Coursera/Data Science/2.- R Programming/Week 1/Exercises/specdata",150)
###################################################################
    
    # Initialize data frame to store files with obs(complete cases) > thresold
    dfcompCasesThres <- data.frame()
    
    # Initialize vertor to store the correlations
    vCorr <- vector(mode="numeric", length=0)
    
    # load the list of files in directory
    fileList <- list.files(directory, full.names = TRUE)
    
    # load in data frame the return of program complete.R to get the complete cases per file
    dfcompCases <- complete("C:/Coursera/Data Science/2.- R Programming/Week 1/Exercises/specdata",1:332)
    
    # loop compCasesdf data frame where complete cases > thresold
    for (i in dfcompCases[,1][(dfcompCases[,2] > thresold)]) {
               # read the corresponding file
               fileData <- read.csv(fileList[i], header = TRUE)
               # get the complete cases
               dfcompCasesThres <- fileData[complete.cases(fileData),]
               # append the correlation to result vector
               vCorr <- c(vCorr, cor(dfcompCasesThres$sulfate, dfcompCasesThres$nitrate)) 
    }
    # returns the vector containig the correlations
    vCorr
}