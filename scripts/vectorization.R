## ----setup, eval=FALSE, echo=FALSE---------------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ------------------------------------------------------------------------
x <- c(1, 3, 4)
y <- c(1, 2, 4)

x ; y

## ------------------------------------------------------------------------
# empty vector 
z <- as.vector(NULL)

# `for` loop to add corresponding elements in each vector
for (i in seq_along(x)) {
        z[i] <- x[i] + y[i]
        print(z)
}

## ------------------------------------------------------------------------
x + y

x * y

x > y

## ------------------------------------------------------------------------
long <- 1:10
short <- 1:5

long
short

long + short

## ------------------------------------------------------------------------
long <- 1:10
c <- 3

long * c

## ---- warning=TRUE-------------------------------------------------------
even_length <- 1:10
odd_length <- 1:3

even_length + odd_length

