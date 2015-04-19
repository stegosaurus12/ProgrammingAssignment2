## These functions create a special "matrix" object that can cache its inverse and compute the inverse

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
#assume input matrix is invertible
 
  #create variable for inverse
  inverse <- NULL
  #store matrix
  matr <- x
  
  #create function to set the matrix and inverse
  set <- function(y) {
    inverse <<- NULL
    x <<- y
  }
  
  #create function to retrieve the matrix
  get <- function() x
  
  #create function to set the inverse
  setinverse <- function(i) inverse <- i
  
  #create function to retrieve the inverse
  getinverse <- function() inverse
  
  #create a list of all the 4 functions I just created
  list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve computes the inverse of the matrix returned from the above function. If it has already been solved and the matrix has not changed, then it retrieves the solved inverse

cacheSolve <- function(x, ...) {
  #retrieve the inverse of the matrix
  inv <- x$getinverse()
  
  #check if inverse of the matrix is empty. If not, return this retrieved value
  if(!is.null(inv)) {
    message("Retrieving cached inverse of matrix!")
    return(inv)
  }
  
  #if inverse was not cached and is now empty...
  #retrieve the matrix
  matr <- x$get()
  
  #find the inverse of the matrix
  inv <- solve(x,...)
  
  #set the inverse of this matrix to cache
  x$setinverse(inv)
  
  #return inverse of matrix
  inv
}
