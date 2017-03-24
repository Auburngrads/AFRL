## ----eval=FALSE----------------------------------------------------------
## # syntax of if statement
## if (test_expression) {
##         statement
## }

## ------------------------------------------------------------------------
x <- c(8, 3, -2, 5)

# without curly braces
if(any(x < 0)) print("x contains negative numbers")

# with curly braces produces same result
if(any(x < 0)){
        print("x contains negative numbers")
}

# an if statement in which the test expression is FALSE
# does not produce any output
y <- c(8, 3, 2, 5)

if(any(y < 0)){
        print("y contains negative numbers")
}

## ---- eval=FALSE---------------------------------------------------------
## # syntax of if...else statement
## if (test_expression) {
##         statement 1
## } else {
##         statement 2
## }

## ------------------------------------------------------------------------
# this test results in statement 1 being executed
x <- c(8, 3, -2, 5)

if(any(x < 0)){
        print("x contains negative numbers")
} else{
        print("x contains all positive numbers")
}

# this test results in statement 2 (or the else statement) being executed
y <- c(8, 3, 2, 5)

if(any(y < 0)){
        print("y contains negative numbers")
} else{
        print("y contains all positive numbers")
}

## ------------------------------------------------------------------------
x <- c(8, 3, 2, 5)

# alternative 1
if(any(x < 0)) print("x contains negative numbers") else print("x contains all positive numbers")

# alternative 2 using the ifelse function
ifelse(any(x < 0), "x contains negative numbers", "x contains all positive numbers")

## ------------------------------------------------------------------------
# this test results in statement 1 being executed
x <- 7

if(x >= 10){
        print("x exceeds acceptable tolerance levels")
} else if(x >= 0 & x < 10){
        print("x is within acceptable tolerance levels")
} else {
         print("x is negative")
}

## ---- eval=FALSE---------------------------------------------------------
## # syntax of for loop
## for(i in 1:100) {
##         <do stuff here with i>
## }

## ------------------------------------------------------------------------
for (i in 2010:2016){
        output <- paste("The year is", i)
        print(output)
}

## ------------------------------------------------------------------------
x <- NULL

for (i in 2010:2016){
        output <- paste("The year is", i)
        x <- append(x, output)
}

x

## ------------------------------------------------------------------------
x <- vector(mode = "numeric", length = 7)
counter <- 1

for (i in 2010:2016){
        output <- paste("The year is", i)
        x[counter] <- output
        counter <- counter + 1
}

x

## ------------------------------------------------------------------------
my.mat <- matrix(NA, nrow = 5, ncol = 5)

for(i in 1:ncol(my.mat)){
        my.mat[, i] <- rpois(5, lambda = i)
}
my.mat

## ---- eval=FALSE---------------------------------------------------------
## # syntax of while loop
## counter <- 1
## 
## while(test_expression) {
##         statement
##         counter <- counter + 1
## }

## ------------------------------------------------------------------------
counter <- 1

while(counter <= 10) {
        print(counter)
        counter <- counter + 1
}

# this for loop provides the same output
counter <- vector(mode = "numeric", length = 10)

for(i in 1:length(counter)) {
        print(i)
}

## ------------------------------------------------------------------------
counter <- 1
x <- 5
set.seed(3)

while(x >= 3 && x <= 8 ) {
        coin <- rbinom(1, 1, 0.5)
        
        if(coin == 1) { ## random walk
                x <- x + 1
        } else {
                x <- x - 1
        }
        cat("On iteration", counter, ", x =", x, '\n')
        counter <- counter + 1
}

## ---- eval=FALSE---------------------------------------------------------
## # syntax of repeat loop
## counter <- 1
## 
## repeat {
##         statement
## 
##         if(test_expression){
##                 break
##         }
##         counter <- counter + 1
## }

## ------------------------------------------------------------------------
counter <- 1
x <- NULL

repeat {
        x <- c(x, round(runif(1, min = 1, max = 25)))
        
        if(all(1:25 %in% x)){
                break
        }
                
        counter <- counter + 1
}

counter

## ------------------------------------------------------------------------
x <- 1:5

for (i in x) {
        if (i == 3){
                break
                }
        print(i)
}

## ------------------------------------------------------------------------
x <- 1:5

for (i in x) {
        if (i == 3){
                next
                }
        print(i)
}

