makeVector <- function(x = numeric()) {
    ######################################################
    # Creates an R object to store a vector and its mean.
    # Sample usages:
    #   Creates the vector  -> myVector <- makeVector(1:15)
    #   Set the vector      -> myVector <- set(c(1,2,3))
    #   Get the vector      -> myVector$get()
    #   Get the mean        -> myVector$getmean()
    #   Set the mean        -> myVector$setmean()
    # the object myVector containst four functions (set, get, setmean, getmean)
    # and x and m data objects
    ######################################################
    
    m <- NULL # initialized in makevector environment
    
    set <- function(y) {
        # assign the input argument (vector) to x in the parent environment
        x <<- y
        # Assign NULL to m in the parent environment. 
        # Clears any m value cached previously
        m <<- NULL
    }
    
    get <- function() x # retrieve the value of x from the parent environment
    
    setmean <- function(mean) m <<- mean # assign the value to m in the parent environment
    
    getmean <- function() m # retrieve the value of m from the parent environment 
    
    # returns the functions within a list to the parents environment
    list(set = set, get = get, setmean = setmean, getmean = getmean)
}
