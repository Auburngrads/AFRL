## ------------------------------------------------------------------------
l <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.5, 4.2))
str(l)

# a list containing a list
l <- list(1:3, list(letters[1:5], c(TRUE, FALSE, TRUE)))
str(l)

## ------------------------------------------------------------------------
l1 <- list(1:3, "a", c(TRUE, FALSE, TRUE))
str(l1)

## ------------------------------------------------------------------------
l2 <- list(l1, c(2.5, 4.2))
str(l2)

## ------------------------------------------------------------------------
l3 <- append(l1, list(c(2.5, 4.2)))
str(l3)

## ------------------------------------------------------------------------
l3$item4 <- "new list item"
str(l3)

## ------------------------------------------------------------------------
str(l1)

## ------------------------------------------------------------------------
l1[[1]] <- c(l1[[1]], 4:6)

str(l1)

l1[[2]] <- c(l1[[2]], c("adding", "to a", "list"))

str(l1)

## ------------------------------------------------------------------------
attributes(l1)

## ------------------------------------------------------------------------
# adding names to a pre-existing list
names(l1) <- c("item1", "item2", "item3")

str(l1)

attributes(l1)

# adding names when creating lists
l2 <- list(item1 = 1:3, item2 = letters[1:5], item3 = c(T, F, T, T))

str(l2)

attributes(l2)

## ------------------------------------------------------------------------
# adding a general comment to list l2 with comment()
comment(l2) <- "This is a comment on a list"

str(l2)

attributes(l2)

# adding a comment to a specific list item with attr() 
attr(l2, "item2") <- "Comment for item2"

str(l2)

attributes(l2)

## ------------------------------------------------------------------------
# extract first list item
l2[1]

# same as above but using the item's name
l2["item1"]

# extract multiple list items
l2[c(1,3)]

# same as above but using the items' names
l2[c("item1", "item3")]

## ------------------------------------------------------------------------
# extract first list item and simplify to a vector
l2[[1]]

# same as above but using the item's name
l2[["item1"]]

# same as above but using the `$` operator
l2$item1

## ------------------------------------------------------------------------
# extract third element from the second list item
l2[[2]][3]

# same as above but using the item's name
l2[["item2"]][3]

# same as above but using the `$` operator
l2$item2[3]

## ------------------------------------------------------------------------
l3 <- list(item1 = 1:3, 
           item2 = list(item2a = letters[1:5], 
                        item3b = c(T, F, T, T)))
str(l3)

## ------------------------------------------------------------------------
# preserve the output as a list
l3[[2]][1]

# same as above but simplify the output
l3[[2]][[1]]

# same as above with names
l3[["item2"]][["item2a"]]

# same as above with `$` operator
l3$item2$item2a

# extract individual element from a nested list item
l3[[2]][[1]][3]

## ---- eval=FALSE---------------------------------------------------------
## # syntax of lapply function
## lapply(X, FUN, ...)

## ------------------------------------------------------------------------
data <- list(item1 = 1:4, 
             item2 = rnorm(10), 
             item3 = rnorm(20, 1), 
             item4 = rnorm(100, 5))

# get the mean of each list item 
lapply(data, mean)

## ------------------------------------------------------------------------
# list of R's built in beaver data
beaver_data <- list(beaver1 = beaver1, 
                    beaver2 = beaver2)

# get the mean of each list item 
lapply(beaver_data, function(x) round(apply(x, 2, mean), 2))

## ------------------------------------------------------------------------
# list of R's built in beaver data
beaver_data <- list(beaver1 = beaver1, 
                    beaver2 = beaver2)

# get the mean of each list item and return as a list
lapply(beaver_data, function(x) round(apply(x, 2, mean), 2))

# get the mean of each list item and simplify the output
sapply(beaver_data, function(x) round(apply(x, 2, mean), 2))

