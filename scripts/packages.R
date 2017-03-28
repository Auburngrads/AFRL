## ----eval=FALSE----------------------------------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'resources','setup.R'))

## ----eval=FALSE----------------------------------------------------------
## install.packages(pkgs = "packagename")

## ---- eval=FALSE---------------------------------------------------------
## # link to Bioconductor URL
## source("http://bioconductor.org/biocLite.R")
## 
## # install core Bioconductor packages
## biocLite()
## 
## # install specific Bioconductor package
## biocLite("packagename")

## ---- eval=FALSE---------------------------------------------------------
## # the devtools package provides a simply function to download GitHub packages
## install.packages("devtools")
## 
## # install package which exists at github.com/username/packagename
## devtools::install_github("username/packagename")

## ---- eval=FALSE---------------------------------------------------------
## # load the package to use in the current R session
## library(packagename)
## 
## # use a particular function within a package without loading the package
## packagename::functionname

## ---- eval=FALSE---------------------------------------------------------
## help.start()           # provides general help links
## help.search("text")    # searches the help system for documentation matching a given character string

## ---- eval=FALSE---------------------------------------------------------
## # provides details regarding contents of a package
## help(package = "packagename")
## 
## # see all packages installed
## library()
## 
## # see packages currently loaded
## search()
## 
## # list vignettes available for a specific package
## vignette(package = "packagename")
## 
## # view specific vignette
## vignette("vignettename")
## 
## # view all vignettes on your computer
## vignette()

