## ------------------------------------------------------------------------
# returns path for the current working directory
getwd()        

# returns the basename of the current working directory
home <- basename(getwd())

# go up one level above the current working directory
setwd('..')

# set the working directory to a specified directory
setwd(home)    

## ---- eval=FALSE---------------------------------------------------------
## # list all objects
## ls()
## 
## # identify if an R object with a given name is present
## exists("object_name")
## 
## # remove defined object from the environment
## rm("object_name")
## 
## # you can remove multiple objects by using the `c()` function
## rm(c("object1", "object2"))
## 
## # basically removes everything in the working environment -- use with caution!
## rm(list = ls())

## ---- eval=FALSE---------------------------------------------------------
## # default shows 25 most recent commands
## history()
## 
## # show 100 most recent commands
## history(100)
## 
## # show entire saved history
## history(Inf)

## ------------------------------------------------------------------------
# save all items in workspace to a .RData file
save.image()                                  

# save specified objects to a .RData file
save(object1, object2, file = "myfile.RData")    

# load workspace into current session
load("myfile.RData")                             

## ---- eval=FALSE---------------------------------------------------------
## # learn about available options
## help(options)
## 
## # view current option settings
## options()
## 
## # change a specific option (i.e. number of digits to print on output)
## options(digits = 3)

