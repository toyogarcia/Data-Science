rankhospital <- function(State, Outcome, num){
    
    # READING DATA FILE    
    dataFile = "C:/Coursera/Data Science/2.- R Programming/Week 4/Practica/Datos Assignment/outcome-of-care-measures.csv"
    datHosp <- read.csv(dataFile, colClasses = "character")
    
    ## Check that state and outcome are valid
    # CHECKING PARAMETERS    
    if (!is.element(Outcome,c("heart attack", "heart failure", "pneumonia"))){
        stop("Invalid Outcome")
    }
    if (!is.element(State, unique(datHosp[,7]))){
        stop("Invalid State")
    }
    
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
    
    ## Return hospital name in that state with the given rank 30-day death rate
    
    # Load the state in St to avoid confusion with column name
    St <- State
    
    # get the hospital name and rate for the State
    dfHosp = subset(datHosp, datHosp[,7] == St & datHosp[,OutCol] != "Not Available" , select=c(2,OutCol))
    
    # Change from character to numeric to order
    dfHosp[,2] <- as.numeric(as.character(dfHosp[,2]))
    
    # add a column with the rank to the data frame
    dfHosp <- cbind(dfHosp, rank(dfHosp[,2], na.last = FALSE, ties.method = "first"))
    
    #order the data by rank
    dfHosp <- dfHosp[order(dfHosp[,3]),]
    
    if (num == "best"){
        dfOrd <- subset(dfHosp, dfHosp[,2] == dfHosp[1,2], select = c(1,2,3))
        dfOrd <- dfOrd[order(dfOrd[,1]),]
    }
    
    if (num == "worst"){
        dfOrd <- subset(dfHosp, dfHosp[,2] == dfHosp[nrow(dfHosp),2], select = c(1,2,3))
        dfOrd <- dfOrd[order(dfOrd[,1]),]
    }
    
    if (is.numeric(num)){
        dfOrd <- subset(dfHosp, dfHosp[,2] == dfHosp[num,2], select = c(1,2,3))
        #dfOrd <- dfOrd[order(dfOrd[,1]),]
    }
    
    as.vector(dfOrd[1,1])
}