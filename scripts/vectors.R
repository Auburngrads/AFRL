## ----vecsetup, eval=FALSE, echo=FALSE------------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ------------------------------------------------------------------------
# integer vector
w <- 8:17
w

# double vector
x <- c(0.5, 0.6, 0.2)
x

# logical vector
y1 <- c(TRUE, FALSE, FALSE)
y1

# logical vector in shorthand
y2 <- c(T, F, F) 
y2

# Character vector
z <- c("a", "b", "c") 
z

## ------------------------------------------------------------------------
# generate a sequence of numbers from 1 to 21 by increments of 2
seq(from = 1, to = 21, by = 2)             

# generate a sequence of numbers from 1 to 21 that has 15 equal incremented 
# numbers
seq(0, 21, length.out = 15)    

# replicates the values in x a specified number of times in a collated fashion
rep(1:4, times = 2)   

# replicates the values in x in an uncollated fashion
rep(1:4, each = 2)    

## ------------------------------------------------------------------------
v <- as.vector(8:17)
v

# turn numeric vector to character
as.vector(v, mode = "character")

## ------------------------------------------------------------------------
# numerics are turned to characters
str(c("a", "b", "c", 1, 2, 3))

# logical are turned to numerics...
str(c(1, 2, 3, TRUE, FALSE))

# or character
str(c("A", "B", "C", TRUE, FALSE))

## ------------------------------------------------------------------------
v1 <- 8:17

c(v1, 18:22)

# same as
c(v1, c(18, c(19, c(20, c(21:22)))))

## ------------------------------------------------------------------------
attributes(v1)

## ------------------------------------------------------------------------
# assigning names to a pre-existing vector
names(v1) <- letters[1:length(v1)]
v1

attributes(v1)

# adding names when creating vectors
v2 <- c(name1 = 1, name2 = 2, name3 = 3)
v2

attributes(v2)

## ------------------------------------------------------------------------
comment(v1) <- "This is a comment on a vector"
v1

attributes(v1)

## ------------------------------------------------------------------------
v1

v1[2]

v1[2:4]

v1[c(2, 4, 6, 8)]

# note that you can duplicate index positions
v1[c(2, 2, 4)]

## ------------------------------------------------------------------------
v1[-1]
v1[-c(2, 4, 6, 8)]

## ------------------------------------------------------------------------
v1[c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE)]

v1[v1 < 12]

v1[v1 < 12 | v1 > 15]

# if logical vector is shorter than the length of the vector being
# subsetted, it will be recycled to be the same length
v1[c(TRUE, FALSE)]

## ------------------------------------------------------------------------
v1["b"]

v1[c("a", "c", "h")]

## ------------------------------------------------------------------------
v1[1]

v1[[1]]

