## This pair of functions will cache the inverse of a matrix
## so that subsequent calls to retrieve the matrix does not 
## require recalculation.

## This function creates a special matrix object that can cache
## its inverse.  


makeCacheMatrix <- function(x = matrix()) {
    
            m_inverse <- NULL
            set <- function(y) {
                x <<- y
                m_inverse <<- NULL
            }
            get <- function() x
            setmatrix <- function(m_inv) m_inverse <<- m_inv
            getmatrix <- function() m_inverse
            list(set = set, get = get,
                 setmatrix = setmatrix,
                 getmatrix = getmatrix)

}


## This function computes the inverse of the special "matrix" 
##returned by makeCacheMatrix above. If the inverse has already 
##been calculated (and the matrix has not changed), then 
##cacheSolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
  
        ## Return a matrix that is the inverse of 'x'
            
            m_inverse <- x$getmatrix()
            if(!is.null(m_inverse)) {
                message("getting inversed matrix...")
                return(m_inverse)
            }
            data <- x$get()
            m_inverse <- solve(data, ...)
            x$setmatrix(m_inverse)
            m_inverse
}


##  Output
# Set up data for testing
#
# > x <- rbind(c(7,-2),c(3,5))
# > x
# [,1] [,2]
# [1,]    7   -2
# [2,]    3    5
# > class(x)
# [1] "matrix"
# > 
# > cx <- makeCacheMatrix(x)
# 
#
# > # First run.  Need to perform function to inverse the matrix and cache the value
# > cacheSolve(cx)
# [,1]       [,2]
# [1,]  0.12195122 0.04878049
# [2,] -0.07317073 0.17073171
#
#
# > # Second run.  Returns cached matrix.
# > cacheSolve(cx)
# getting inversed matrix...
# [,1]       [,2]
# [1,]  0.12195122 0.04878049
# [2,] -0.07317073 0.17073171
# > 






