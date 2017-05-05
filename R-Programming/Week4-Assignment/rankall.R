rankall <- function(Outcome, num = "best"){
    
    # CHECKING PARAMETERS    
    if (!is.element(Outcome,c("heart attack", "heart failure", "pneumonia"))){
        stop("Invalid Outcome")
    }
    if (!is.element(num,c("best","worst")) & (!is.numeric(num)) ) {
        stop("Invalid num")
    }
    
    ## Read outcome data
    dataFile = "C:/Coursera/Data Science/2.- R Programming/Week 4/Practica/Datos Assignment/outcome-of-care-measures.csv"
    datHosp <- read.csv(dataFile, colClasses = "character")
    
    # Get the column number for the Outcome
    if (Outcome == "heart attack") {
        OutCol <- 11
    }
    if (Outcome == "heart failure") {
        OutCol <- 17
    }
    if (Outcome == "pneumonia") {
        OutCol <- 23
    }

    # Initialize result data frames
    dfResults <- data.frame(hospital=character(0), state=character(0))
        
    # load the list of states ordered alphabetically
    statesList <- sort(unique(datHosp[,7]))
    
    ## For each state, find the hospital of the given rank
    for (i in statesList) {
        
        # get the data hospitalName and Measure Value for the state and Outcome provided
        dfHosp <- subset(datHosp, datHosp[,7] == i & datHosp[,OutCol] != "Not Available" , select=c(2,OutCol))
    
        # Change outcome from character to numeric to order
        dfHosp[,2] <- as.numeric(as.character(dfHosp[,2]))
        
        #order the data by Outcome value then by hospital name
        dfHosp <- dfHosp[order(dfHosp[,2],dfHosp[,1]),]
        
        # add a column with State and the rank to the data frame
        dfHosp <- cbind(dfHosp, rank(dfHosp[,2], na.last = FALSE, ties.method = "first"))
        dfHosp <- cbind(dfHosp, i)
        colnames(dfHosp) <- c("Hospital","Measure","Rank","State") 
        
        #print(dfHosp)
        
        # best
        if (num == "best"){
            dfResults <- rbind(dfResults, dfHosp[1,c(1,4)])
        }
        
        # worst
        if (num == "worst"){
            dfResults <- rbind(dfResults, dfHosp[nrow(dfHosp),c(1,4)])
        }
        
        # num
        if (is.numeric(num)){
            if (nrow(dfHosp[dfHosp[,3]==num,]) == 0) {
                dfResults <- rbind( dfResults, data.frame("Hospital"="<NA>", "State"=i))
            }
            else {
            dfResults <- rbind(dfResults, dfHosp[dfHosp[,3]==num, c(1,4)])
            }
        }
    }
    
    ## Return a data frame with the hospital names and the (abbreviated) state name
    dfResults
}