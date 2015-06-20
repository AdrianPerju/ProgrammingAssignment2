## This functions instantiate an object which keep a matrix value and it's inverse, 
##     permitting access to these values throught four functions defined inside the object
## The second one determine de inverse only if it is not yet computed, else return its value from cache

## makeCacheMatrix instantiate an object able to store 
## a matrix and related value of it's inverse 
## This object let us operate with four functions to set/get its values:
##    setMatrix: to store a matrix value into the object
##    getMatrix: to obtain the value of the matrix stored on object
##	setInverse: to store the value of matrix's inverse into object
##	getInverse: to obtain inverse value of the matrix stored on object
 
makeCacheMatrix <- function(x = matrix()) {
##
##
	inverse<-NULL
	
	# when a new x value is stored on object, than the inverse value is reseted to NULL
	setMatrix<-function(y){
		x<<-y
		inverse<<-NULL
	}
	
	# getMatrix: return the 'x' value stored on object
	getMatrix<-function() {
		x
	}

	# setInverse: set the x's inverse value on object
	setInverse<-function(solve) {
		inverse<<- solve
	}

	# getInverse: return the x's inverse stored on object
	getInverse<-function() {
		inverse	
	}
	
	# return a list of functions stored on object
	list(setMatrix=setMatrix, getMatrix=getMatrix, setInverse=setInverse, getInverse=getInverse)
}




##  "cacheSolve" function take as argument an object of type "makeCacheMatrix" 
##  if the inverse of the matrix is not yet determinate, 
##       than  the function compute the inverse and store it inside the object
##  other way, just  return the value already stored inside the object 
##       (without any computing at that moment)

cacheSolve <- function(x) {
      ## Return a matrix that is the inverse of 'x'
	##
	## get the inverse value from cache 
 	m<-x$getInverse()
    	# verify if the inverse value is already cached
	if(!is.null(m)){
      	message("data returned from cache")
      	return(m)
    	}
	# the value of inverse is not yet computed   
	# obtain the value of the matrix to be inverse                   
    	matrix<-x$getMatrix()
	# computing the inverse
    	m<-solve(matrix)
	# store the value inside the object
    	x$setInverse(m)
	# return the inverse value
    	m
}


