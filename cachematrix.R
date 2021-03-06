
###########Code will cache the result of a matrix inversion ##########


# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}

#########################  End of Code ################################################

######################## Dry run  ###########################

##x = rbind(c(2,3), c(2,2))
##m = makeCacheMatrix(x)
##m$get()
##       [,1]  [,2]
## [1,]   2     3
## [2,]   2     2

## No cache in the first run
##cacheSolve(m)
##           [,1]      [,2]
## [1,]       -1        1.5
## [2,]        1       -1.0

## Retrieving from the cache in the second run
##cacheSolve(m)
## getting cached data.
##           [,1]      [,2]
## [1,]       -1        1.5
## [2,]        1       -1.0

