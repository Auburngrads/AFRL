## ----dfsetup, eval=FALSE, echo=FALSE-------------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ------------------------------------------------------------------------
df <- data.frame(col1 = 1:3, 
                 col2 = c("this", "is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE), 
                 col4 = c(2.5, 4.2, pi))

# assess the structure of a data frame
str(df)

# number of rows
nrow(df)

# number of columns
ncol(df)

## ------------------------------------------------------------------------
df <- data.frame(col1 = 1:3, 
                 col2 = c("this", "is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE), 
                 col4 = c(2.5, 4.2, pi), 
                 stringsAsFactors = FALSE)

# note how col2 now is of a character class
str(df)

## ------------------------------------------------------------------------
v1 <- 1:3
v2 <-c("this", "is", "text")
v3 <- c(TRUE, FALSE, TRUE)

# convert same length vectors to a data frame using data.frame()
data.frame(col1 = v1, col2 = v2, col3 = v3)

# convert a list to a data frame using as.data.frame()
l <- list(item1 = 1:3, item2 = c("this", "is", "text"), item3 = c(2.5, 4.2, 5.1))
l

as.data.frame(l)

# convert a matrix to a data frame using as.data.frame()
m1 <- matrix(1:12, nrow = 4, ncol = 3)
m1

as.data.frame(m1)

## ------------------------------------------------------------------------
df

# add a new column
v4 <- c("A", "B", "C")

cbind(df, v4)

## ------------------------------------------------------------------------
df

str(df)

## ------------------------------------------------------------------------
df2 <- rbind(df, c(4, "R", F, 1.1))

df2

str(df2)

## ------------------------------------------------------------------------
adding_df <- data.frame(col1 = 4, 
                        col2 = "R", 
                        col3 = FALSE, 
                        col4 = 1.1, 
                        stringsAsFactors = FALSE)

df3 <- rbind(df, adding_df)

df3

str(df3)

## ------------------------------------------------------------------------
# basic matrix
df

dim(df)
## [1] 3 4

attributes(df)

## ------------------------------------------------------------------------
# add row names
rownames(df) <- c("row1", "row2", "row3")

df

attributes(df)

## ------------------------------------------------------------------------
# add/change column names with colnames()
colnames(df) <- c("col_1", "col_2", "col_3", "col_4")

df

attributes(df)

# add/change column names with names()
names(df) <- c("col.1", "col.2", "col.3", "col.4")

df

attributes(df)

## ------------------------------------------------------------------------
# adding a comment attribute
comment(df) <- "adding a comment to a data frame"

attributes(df)

## ------------------------------------------------------------------------
df

# subsetting by row numbers
df[2:3, ]

# subsetting by row names
df[c("row2", "row3"), ]

# subsetting columns like a list
df[c("col.2", "col.4")]

# subsetting columns like a matrix
df[ , c("col.2", "col.4")]

# subset for both rows and columns
df[1:2, c(1, 3)]

# use a vector to subset
v <- c(1, 2, 4)
df[ , v]

## ------------------------------------------------------------------------
# simplifying results in a named vector
df[, 2]

# preserving results in a 3x1 data frame
df[, 2, drop = FALSE]

## ------------------------------------------------------------------------
head(mtcars)

## ------------------------------------------------------------------------
# using brackets
mtcars[mtcars$mpg > 20, ]

# using the simplified subset function
subset(mtcars, mpg > 20)

## ------------------------------------------------------------------------
# using brackets
mtcars[mtcars$mpg > 20 & mtcars$cyl == 6, ]

# using the simplified subset function
subset(mtcars, mpg > 20 & cyl == 6)

## ------------------------------------------------------------------------
# using brackets
mtcars[mtcars$mpg > 20 & mtcars$cyl == 6, c("mpg", "cyl", "wt")]

# using the simplified subset function
subset(mtcars, mpg > 20 & cyl == 6, c("mpg", "cyl", "wt"))

