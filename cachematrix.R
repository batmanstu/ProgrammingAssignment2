## cacheMatrix.R
##
## Coursera - R Programming - Programming Assignment 2
##
## Caching the Inverse of a Matrix
##
## File contains 2 associated functions with the aim of caching the inverse of a matrix to reduce the
## calculation overhead of subsequent retrievels.
## 
## Example Usage:
## a) create 'matrix' object 
## > m <- makeCacheMatrix(matrix(c(9,1,3,6,13,11,7,0,5,7,4,7,2,6,1,10),nrow=4,ncol=4))
## b) Calculate the inverse of the matrix
## > cacheSolve(m)

# Function:    makeCacheMatrix
# Description: Creates a special 'matrix' object that can cache its inverse.
# Parameters:
# 1) x - the matrix to cache
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) i <<- inverse
  get_inverse <- function() i
  
  list(set=set, 
       get=get,
       set_inverse=set_inverse,
       get_inverse=get_inverse)
}

# Function:    cacheSolve
# Description: Computes the inverse of the matrix object returned by function makeCacheMatrix.
#              Inverse retrieved from cache if it has been calculated previously.
# Parameters: 
# 1) x   - 'matrix' object returned by makeCacheMatrix function
# 2) ... - optional additional parameters
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$get_inverse()
    if (!is.null(inverse)) {
      message("Getting cached Data")
      return(m)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$set_inverse(inverse)
    inverse
}
