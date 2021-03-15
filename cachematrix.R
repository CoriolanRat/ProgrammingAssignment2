## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


A <- matrix(c(-3,5,1,0),nrow=2, ncol=2)
B <- matrix(c(0,1,0.2,0.6),nrow=2, ncol=2)
C <- matrix(c(-3,5,1,0),nrow=2, ncol=2)
output <- makeCacheMatrix(C)

cacheSolve(output)


cacheSolve(output)

