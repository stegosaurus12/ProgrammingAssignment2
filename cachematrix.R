## These functions create a special "matrix" object that can cache its inverse and compute the inverse

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
#assume input matrix is invertible
 
  #create variable for inverse
  inverse <- NULL
  
  #create function to set the matrix and inverse
  set <- function(y) {
    inverse <<- NULL
    x <<- y
  }
  
  #create function to retrieve the matrix
  get <- function() x
  
  #create function to set the inverse
  setinverse <- function(i) inverse <<- i
  
  #create function to retrieve the inverse
  getinverse <- function() inverse
  
  #create a list of all the 4 functions I just created
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve computes the inverse of the matrix returned from the above function. If it has already been solved and the matrix has not changed, then it retrieves the solved inverse

cacheSolve <- function(x, ...) {
  #retrieve the inverse of the matrix
  inverse <- x$getinverse()
  
  #check if inverse of the matrix is empty. If not, return this retrieved value
  if(!is.null(inverse)) {
    message("Retrieving cached data")
    return(inverse)
  }
  
  #if inverse was not cached and is now empty...
  #retrieve the matrix
  data <- x$get()
  
  #find the inverse of the matrix
  inverse <- solve(data,...)
  
  #set the inverse of this matrix to cache
  x$setinverse(inverse)
  
  #return inverse of matrix
  inverse
}