## Theese functions create a  matrix, and calculate or retrieve it's inverse
## depending if it's already been calculated or not

## This first function creates the matrix given the parametres and creates
## the variable in which the inverse matrix will be stored, and once it's been
## calculated, stores it


makeCacheMatrix <- function(x = matrix()) {
inv<-NULL
    set<-function(y){
        x<<-y
        inv<<-NULL
    }
    get<-function()x
    setinverse<-function(solve) inv<<-solve
    getinverse<- function() inv
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)

}


## This function retrieves the value of the inverse matrix if it's already
## been calculated, and if it hasn't it calculates it.

cacheSolve <- function(x, ...) {
     inv<-x$getinverse()
    if(!is.null(inv)){
        message("Getting Cached Data")
        return(inv)
    }
    data<-x$get()
    inv<-solve(data,...)
    x$setinverse(inv)
    inv   
}