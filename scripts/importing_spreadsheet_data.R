## ----sheetdatasetup, eval=FALSE, echo=FALSE------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ----spreadsheet-data, echo=FALSE----------------------------------------
library(gdata)
library(stringr)
data_gov <- read.csv(DATA('fap.csv'), stringsAsFactors = F)
rents <- gdata::read.xls(DATA('FY2015F.xls'))
zip_data <- read.csv(DATA('expd141.csv'), stringsAsFactors = F)
zip_data2 <- zip_data

## ---- eval=FALSE---------------------------------------------------------
## # the url for the online CSV
## url <- "https://s3.amazonaws.com/bsp-ocsit-prod-east-appdata/datagov/wordpress/federal-agency-participation.csv"
## 
## # use read.csv to import
## data_gov <- read.csv(url, stringsAsFactors = FALSE)
## 
## # Change the column names
## colnames(data_gov) <- c('Row',
##                         'Agency',
##                         'Publisher',
##                         'Data Sets',
##                         'Last Event')
## 
## # For brevity only display the first 6 rows
## # and columns 2, 4, and 5
## data_gov[1:6, c(2,4,5)]

## ---- echo=FALSE---------------------------------------------------------
colnames(data_gov) <- c('Row','Agency','Publisher','Data Sets','Last Event')
data_gov[1:6, c(2,4,5)]

## ---- eval=FALSE---------------------------------------------------------
## library(gdata)
## 
## # the url for the online Excel file
## url <- "http://www.huduser.org/portal/datasets/fmr/fmr2015f/FY2015F_4050_Final.xls"
## 
## # use read.xls to import
## rents <- gdata::read.xls(url)
## 
## rents[1:6, 1:10]

## ---- echo=FALSE---------------------------------------------------------
rents[1:6, 1:10]

## ---- eval=FALSE---------------------------------------------------------
## url <- "http://www.bls.gov/cex/pumd/data/comma/diary14.zip"
## 
## # download .zip file to "dataset.zip"
## download.file(url, dest = "dataset.zip", mode = "wb")
## 
## # unzip contents of "dataset.zip" to working directory
## # unzips as a folder named "diary14"
## unzip ("dataset.zip", exdir = ".")
## 
## # assess the files contained in the .zip file which
## list.files("diary14")

## ----engine="block2"-----------------------------------------------------
[1] "dtbd141.csv" "dtbd142.csv" "dtbd143.csv" "dtbd144.csv" "dtid141.csv"
[6] "dtid142.csv" "dtid143.csv" "dtid144.csv" "expd141.csv" "expd142.csv"
[11] "expd143.csv" "expd144.csv" "fmld141.csv" "fmld142.csv" "fmld143.csv"
[16] "fmld144.csv" "memd141.csv" "memd142.csv" "memd143.csv" "memd144.csv"

## ---- eval=FALSE---------------------------------------------------------
## zip_data <- read.csv(unz("dataset.zip", "diary14/expd141.csv"))
## 
## zip_data[1:5, 1:10]

## ---- echo=FALSE---------------------------------------------------------
zip_data[1:5, 1:10]

## ---- eval=FALSE---------------------------------------------------------
## # Create a temp. file name
## temp <- tempfile()
## 
## # Use download.file() to fetch the file into the temp. file
## download.file("http://www.bls.gov/cex/pumd/data/comma/diary14.zip", temp)
## 
## # Use unz() to extract the target file from temp. file
## zip_data2 <- read.csv(unz(temp, "diary14/expd141.csv"))
## 
## # Remove the temp file via unlink()
## unlink(temp)
## 
## zip_data2[1:5, 1:10]

## ---- echo=FALSE---------------------------------------------------------
zip_data2[1:5, 1:10]

## ------------------------------------------------------------------------
library(XML)
library(httr)

# url hosting multiple links to data sets
url <- "http://download.bls.gov/pub/time.series/ap/"

get <- httr::GET(url = url)
content <- httr::content(get)
xml <- XML::htmlTreeParse(content, useInternalNodes = T)

# identify the links available
links <- XML::getHTMLLinks(xml)

links

## ------------------------------------------------------------------------
library(stringr)

# extract names for desired links and paste to url
links_data <- links[stringr::str_detect(links, "data")]

# paste url to data links to have full url for data sets
# use str_sub and regexpr to paste links at appropriate 
# starting point
filenames <- paste0(url, 
                    stringr::str_sub(links_data, 
                    start = regexpr("ap.data", links_data)))

filenames

## ---- eval=FALSE---------------------------------------------------------
## # create empty list to dump data into
## data_ls <- list()
## 
## for(i in 1:length(filenames)){
## 
##     url <- filenames[i]
##     data <- read.delim(url)
##     data_ls[[length(data_ls) + 1]] <- list(url = filenames[i],
##                                            data = data)
## 
## }
## 
## str(data_ls)

## ---- echo=FALSE---------------------------------------------------------
text <- readLines(DATA('data_ls_str.R'))
writeLines(text)

