## Put comments here that give an overall description of what your
## functions do

## creates a vector containing functions to set the value of the matrix,
## get the value of the matrix, set the inverse of the matrix, and
## get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setmatrix <- function(set) {m <<- set}
  getmatrix <- function() {m}
  list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)
}


## returns a cached inverse matrix. If no inverse is found, 
##solves for the inverse matrix.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}