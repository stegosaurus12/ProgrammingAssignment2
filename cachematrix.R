## These functions create a special "matrix" object that can cache its inverse and compute the inverse

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
#assume input matrix is invertible
  #create variable for inverse
  inverse <- NULL
  #store matrix
  matr <- x
  
  set <- function(y) {
    inverse <<- NULL
    x <<- y
  }
  
  get <- function() x
  setinverse <- function(i) inverse <- i
  getinverse <- function() inverse
  list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve computes the inverse of the matrix returned from the above function. If it has already been solved and the matrix has not changed, then it retrieves the solved inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
