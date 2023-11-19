## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
### this funciton defines a matrix as x and sets m value to NULL.
### in the subsequent lines it allocates the value of y to x and NULL to m both in the parent environment.
### it uses setSolve and getSolve to set inverse and assign it to m in parent environment, and get 
### the value of the calculated inverse matrix that is m. 
### finally it defines each function within a list. 
makeCacheMatrix <- function(x = matrix()) {
        m<<- NULL
        set <- function(y){
                x<<-y
                m<<- NULL
        }
        get<- function () x
        setSolve<- function (solve) m <<- solve
        getSolve <- function()m
        list(set= set, get=get,
             setSolve=setSolve, getSolve=getSolve)
}


## Write a short comment describing this function
##### the bleow function attempts to find the inverse of the matrix first- as it is allocated to m. 
##### if there is an inverse matrix calculated it retrives it, otherwise it calculates the inverse. 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getSolve()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <-x$get()
        m <- solve(data,...)
        x$setSolve(m)
        m
}
