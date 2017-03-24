## ----structures, eval=FALSE, echo=FALSE----------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ----datastructures, echo=FALSE------------------------------------------
Dimensions <- c('1D','2D','nD')
Homogenous <- c('Atomic Vector', 'Matrix','Array')
Heterogenous <- c('List','Data Frame','')
types <- data.frame(Dimensions,
                    Homogenous,
                    Heterogenous)
knitr::kable(types,caption = 'Types of data structures in R (adapted from _Advanced R_, H. Wickham)')

## ------------------------------------------------------------------------
# different data structures
vector <- 1:10
list <- list(item1 = 1:10, item2 = LETTERS[1:18])
matrix <- matrix(1:12, nrow = 4)   
df <- data.frame(item1 = 1:18, item2 = LETTERS[1:18])

# identify the structure of each object
str(vector)

str(list)

str(matrix)

str(df)

## ------------------------------------------------------------------------
# assess attributes of an object
attributes(df)

attributes(matrix)

# assess names of an object
names(df)

# assess the dimensions of an object
dim(matrix)

# assess the class of an object
class(list)

# access the length of an object
length(vector)

# note that length will measure the number of items in
# a list or number of columns in a data frame
length(list)

length(df)

