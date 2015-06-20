v <- c(7,0,-3,2,3,4,1,-1,-2)
myMatrix <- matrix(v, nrow=3, ncol=3)

aa<-makeCacheMatrix(myMatrix)
aa$getMatrix()
aa$getInverse()
cacheSolve(aa)
aa$getInverse()

round(aa$getMatrix()%*%aa$getInverse())

myMatrixInv<-solve(myMatrix)
myMatrixInv

aa$getMatrix()
aa$getInverse()
myMatrix2<-matrix(rnorm(9),3,3)
aa$setMatrix(myMatrix2)
aa$getMatrix()
aa$getInverse()
cacheSolve(aa)

solve(myMatrix2)