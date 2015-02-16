## Caching the Inverse of a Matrix
## https://class.coursera.org/rprog-011/human_grading

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  ## The cached inverted matrix data
  inverse <- NULL
  
  ## Sets un-inverted matrix
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  ## Gets the un-inverted matrix
  get <- function() {
    return(x)
  }
  
  ## Sets the inverted matrix
  setinverse <- function(inv) {
    inverse <<- inv
  }
  
  ## Gets the cached inverted matrix
  getinverse <- function() {
    return(inverse)
  }
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then the cachesolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  return(inverse)
}
