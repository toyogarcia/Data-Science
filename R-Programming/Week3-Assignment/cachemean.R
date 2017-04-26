cachemean <- function(x, ...) {
    ########################################################################
    # Requires an argument returned by makevector to retrieve the mean
    # from the cached value stored in makevector object's environment
    # Usage: 
    #   Create the vector: myVector <- makeVector(1:15)
    #   Return the cached mean, if not cached, calculate and cache it -> cachemean(myVector)
    #######################################################################
    
    # try to store in m the cached mean
    m <- x$getmean()
    
    # if cached the return the mean
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    # if not cached then calculates the mean
    # get the vector
    data <- x$get()
    # calculates the mean of the vector
    m <- mean(data, ...)
    # cache the mean
    x$setmean(m)
    # return the mean
    m
}