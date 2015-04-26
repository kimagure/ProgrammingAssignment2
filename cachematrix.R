## This is the clone of Example: Caching the Mean of a Vector but instead
## it caches the inverse of a matrix x with solve() function


## The function is to create a list containing functions
## to set/get matrix & inverse matrix
makeCacheMatrix <- function(x = matrix()) {
  c <- NULL
  set <- function(y) {
    x <<- y
    c <<- NULL
  }
  get <- function() x
  setcache <- function(cache) c <<- cache
  getcache <- function() c
  list(set = set, get = get,
       setcache = setcache,
       getcache = getcache)
}
  


## The function returns a matrix that is the inverse of 'x'. If the inverse
## already exists in cache, it will load the data instead of recalculating the value
cacheSolve <- function(x, ...) {
  c <- x$getcache()
  if(!is.null(c)) {
    message("getting cached data")
    return(c)
  }
  data <- x$get()
  c <- solve(data, ...)
  x$setcache(c)
  c
}


