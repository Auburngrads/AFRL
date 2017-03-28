## ----setup, eval=F-------------------------------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'resources','setup.R'))

## ---- eval=FALSE---------------------------------------------------------
## # Good
## "weather-analysis.R"
## "emerson-text-analysis.R"
## 
## # Bad
## "basic-stuff.r"
## "detail.r"

## ---- eval=FALSE---------------------------------------------------------
## "0-download.R"
## "1-preprocessing.R"
## "2-explore.R"
## "3-fit-model.R"

## ------------------------------------------------------------------------
# Good
average <- mean(feet / 12 + inches, na.rm = TRUE)

# Bad
average<-mean(feet/12+inches,na.rm=TRUE)

## ------------------------------------------------------------------------
# Good
x <- 1:10
base::get

# Bad
x <- 1 : 10
base :: get

