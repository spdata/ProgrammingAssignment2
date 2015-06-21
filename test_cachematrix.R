# Use to test Assignment 2

x <- rbind(c(7,-2),c(3,5))
x
cx <- makeCacheMatrix(x)
# First run.  Need to perform function to inverse the matrix and cache the value
cacheSolve(cx)
# Second run.  Returns cached matrix.
cacheSolve(cx)

