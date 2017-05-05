best <- function(State, Outcome){

    # READING DATA FILE    
    dataFile = "C:/Coursera/Data Science/2.- R Programming/Week 4/Practica/Datos Assignment/outcome-of-care-measures.csv"
    datHosp <- read.csv(dataFile, colClasses = "character")
    
    # CHECKING PARAMETERS    
    if (!is.element(Outcome,c("heart attack", "heart failure", "pneumonia"))){
        stop("Invalid Outcome")
    }
    if (!is.element(State, unique(datHosp[,7]))){
        stop("Invalid State")
    }

    # Get the column number for the Outcome
    if (Outcome == "heart attack") {
        OutCol <- 13
    }
    if (Outcome == "heart failure") {
        OutCol <- 19
    }
    if (Outcome == "pneumonia") {
        OutCol <- 25
    }
    
    # Load the state in St to avoid confusion with column name
    St <- State
    # get the hospital name and rate for the State
    dfHosp = subset(datHosp, datHosp[,7] == St & datHosp[,OutCol] != "Not Available" , select=c(2,OutCol))
    
    # Change from character to numeric to get the min
    dfHosp[,2] <- as.numeric(as.character(dfHosp[,2]))
    
    #Get the record(s) with min value
    dfHospOrd <- dfHosp[dfHosp[,2] == min(dfHosp[,2]), ]
    
    #order the data alphabetically
    dfHospOrd <- dfHospOrd[order(dfHospOrd$Hospital.Name), 1]
    
    # return the data
    dfHospOrd
}