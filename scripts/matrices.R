## ------------------------------------------------------------------------
# numeric matrix
m1 <- matrix(data = 1:6, nrow = 2, ncol = 3)

m1

## ------------------------------------------------------------------------
# numeric matrix
m1 <- matrix(data = 1:6, nrow = 2, ncol = 3, byrow = TRUE)

m1

## ------------------------------------------------------------------------
str(m1)

attributes(m1)

## ------------------------------------------------------------------------
# a character matrix
m2 <- matrix(letters[1:6], nrow = 2, ncol = 3)

m2

# structure of m2 is simply character vector with 2x3 dimension
str(m2)

attributes(m2)

## ------------------------------------------------------------------------
v1 <- 1:4
v2 <- 5:8

cbind(v1, v2)

rbind(v1, v2)

# bind several vectors together
v3 <- 9:12

cbind(v1, v2, v3)

## ------------------------------------------------------------------------
mat2 <- matrix(1)

## ---- eval=FALSE---------------------------------------------------------
## mat2 <- edit(mat2)

## ------------------------------------------------------------------------
m1 <- cbind(v1, v2)
m1

# add a new column
cbind(m1, v3)

# or add a new row
rbind(m1, c(4.1, 8.1))

## ------------------------------------------------------------------------
# basic matrix
m2 <- matrix(1:12, nrow = 4, ncol = 3)

m2

# the dimension attribute shows this matrix has 4 rows and 3 columns
attributes(m2)

## ------------------------------------------------------------------------
# add row names as an attribute
rownames(m2) <- c("row1", "row2", "row3", "row4")

m2

# attributes displayed will now show the dimension, list the row names
# and will show the column names as NULL
attributes(m2)

# add column names
colnames(m2) <- c("col1", "col2", "col3")
m2

attributes(m2)

## ------------------------------------------------------------------------
dimnames(m2)[[1]] <- c("row_1", "row_2", "row_3", "row_4")
m2

# column names are contained in the second list item
dimnames(m2)[[2]] <- c("col_1", "col_2", "col_3")
m2

## ------------------------------------------------------------------------
comment(m2) <- "adding a comment to a matrix"

attributes(m2)

## ------------------------------------------------------------------------
m2

## ------------------------------------------------------------------------
# subset for rows 1 and 2 but keep all columns
m2[1:2, ]

# subset for columns 1 and 3 but keep all rows
m2[ , c(1, 3)]

# subset for both rows and columns
m2[1:2, c(1, 3)]

# use a vector to subset
v <- c(1, 2, 4)
m2[v, c(1, 3)]

# use names to subset
m2[c("row_1", "row_3"), ]

## ------------------------------------------------------------------------
# simplifying results in a named vector
m2[, 2]

# preserving results in a 4x1 matrix
m2[, 2, drop = FALSE]

## ------------------------------------------------------------------------
mat1 <- matrix(sample(1:50,size = 25), 
               nrow = 5, 
               byrow = T) 
mat1

## ------------------------------------------------------------------------
diag(mat1)  ### Diagonal elements `mat1`

## ------------------------------------------------------------------------
det(mat1)   ### Determinant of `mat1`

## ------------------------------------------------------------------------
solve(mat1) ### Returns the inverse `mat1` if it exists

## ------------------------------------------------------------------------
t(mat1) ### Returns the tranpose of `mat1`

## ------------------------------------------------------------------------
eigen(mat1) ### Returns the eigenvalues and eigenvectors of `mat1`

