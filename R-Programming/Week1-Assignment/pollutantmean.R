pollutantmean <- function (directory,pollutant,id=1:332) {
######################################################################################################
# Parameters:
# directory -> location of datafiles
# pollutant -> nitrate or sulfate
# id -> Subset of files to process (from 1 to 332)
# Sample call:
# pollutantmean("C:/Coursera/Data Science/2.- R Programming/Week 1/Exercises/specdata","nitrate",1:10)
######################################################################################################
    
    # Returns the full name of the files in the directory in a vector
    dataFiles <- list.files(path=directory, full.names = TRUE)
    
    # initialize data frame to store file data
    totPollData <- data.frame()
    
    # for files included in id parameter
    for (i in id) {
        # add content of every datafile to totPollData
        totPollData <- rbind(totPollData, read.csv(dataFiles[i]))
    }
    
    # get the mean of the cumulated values excluding NAs
    totMean <- mean(totPollData[,pollutant], na.rm=TRUE)
    
    totMean
}