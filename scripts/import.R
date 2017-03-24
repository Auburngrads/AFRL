## ----importsetup, eval=!FALSE, echo=FALSE--------------------------------
source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ----examptable, echo=FALSE----------------------------------------------
mydata = read.csv(DATA("mydata.csv"))
knitr::kable(mydata, caption = 'Example table of comma separated values (CSV)')

## ------------------------------------------------------------------------
mydata = read.csv(DATA("mydata.csv"))
mydata

str(mydata)

## ------------------------------------------------------------------------
mydata_2 = read.csv(DATA("mydata.csv"), stringsAsFactors = FALSE)
mydata_2

str(mydata_2)

## ------------------------------------------------------------------------
# provides same results as read.csv above
mydata <- read.table(DATA("mydata.csv"), 
                     sep = ",", 
                     header = TRUE, 
                     stringsAsFactors = FALSE)

mydata

## ------------------------------------------------------------------------
# set column and row names
read.table(DATA("mydata.csv"), 
           sep = ",", 
           header = TRUE, 
           stringsAsFactors = FALSE,
           col.names = c("Var 1", "Var 2", "Var 3"),
           row.names = c("Row 1", "Row 2", "Row 3"))

# manually set the classes of the columns 
set_classes <- read.table(DATA("mydata.csv"), 
                          sep = ",", 
                          header = TRUE,
                          colClasses = c("numeric", "character", "character"))
str(set_classes)

# limit the number of rows to read in
read.table(DATA("mydata.csv"), 
           sep = ",", 
           header = TRUE, 
           nrows = 2)

## ------------------------------------------------------------------------
# reading in tab delimited text files
read.delim(DATA("mydata.txt"))

# provides same results as read.delim
read.table(DATA("mydata.txt"), sep = "\t", header = TRUE)

## ------------------------------------------------------------------------
library(readr)
mydata_3 = read_csv(DATA("mydata.csv"))
mydata_3

str(mydata_3)

## ------------------------------------------------------------------------
# specify the column class using col_types
read_csv(DATA("mydata.csv"), col_types = list(col_double(), 
                                        col_character(), 
                                        col_character()))

# we can also specify column classes with a string
# in this example d = double, _ skips column, c = character
read_csv(DATA("mydata.csv"), 
         col_types = "d_c")

# set column names
read_csv(DATA("mydata.csv"), 
         col_names = c("Var 1", "Var 2", "Var 3"), 
         skip = 1)

# set the maximum number of lines to read in
read_csv(DATA("mydata.csv"), 
         n_max = 2)

## ------------------------------------------------------------------------
library(xlsx)

# read in first worksheet using a sheet index or name
read.xlsx(DATA("mydata.xlsx"), sheetName = "PICK_ME_FIRST!")

read.xlsx(DATA("mydata.xlsx"), sheetIndex = 1)

# read in second worksheet
read.xlsx(DATA("mydata.xlsx"), sheetName = "Sheet2")

## ------------------------------------------------------------------------
# a worksheet with comments in the first two lines
read.xlsx(DATA("mydata.xlsx"), sheetName = "extra_header")

# read in all data below the second line
read.xlsx(DATA("mydata.xlsx"), sheetName = "extra_header", startRow = 3)

# read in a range of rows
read.xlsx(DATA("mydata.xlsx"), sheetIndex = 3, rowIndex = 3:5)

## ------------------------------------------------------------------------
# read in data without changing class type
mydata_sheet1.1 <- read.xlsx(DATA("mydata.xlsx"), 
                             sheetName = "PICK_ME_FIRST!")

str(mydata_sheet1.1)

# read in data and change class type
mydata_sheet1.2 <- read.xlsx(DATA("mydata.xlsx"), 
                             sheetIndex = 1,
                             stringsAsFactors = FALSE,
                             colClasses = c("double", "character", "logical"))

str(mydata_sheet1.2)

## ------------------------------------------------------------------------
# by default keepFormula is set to FALSE so only
# the formula output will be read in
read.xlsx(DATA("mydata.xlsx"), sheetName = "functions")

# changing the keepFormula to TRUE will display the equations
read.xlsx(DATA("mydata.xlsx"), 
          sheetName = "functions", 
          keepFormulas = TRUE)

## ------------------------------------------------------------------------
library(readxl)

excel_sheets(DATA("mydata.xlsx"))

mydata <- read_excel(DATA("mydata.xlsx"), sheet = "date_time")
mydata

str(mydata)

## ------------------------------------------------------------------------
# change variable names by skipping the first row
# and using col_names to set the new names
read_excel(DATA("mydata.xlsx"), 
           sheet = "date_time", 
           skip = 1, 
           col_names = paste("Var", 1:5))

# sometimes missing values are set as a sentinel value
# rather than just left blank - (i.e. "999")
read_excel(DATA("mydata.xlsx"), sheet = "date_time")

# we can change these to missing values with na argument
read_excel(DATA("mydata.xlsx"), sheet = "unique_NA", na = "999")

## ------------------------------------------------------------------------
coltypes = c("numeric", "blank", "numeric", "date", "blank")

mydata_ex <- read_excel(DATA("mydata.xlsx"), 
                        sheet = "date_time",
                        col_types = coltypes)
mydata_ex

# change variable 3 to a logical variable
mydata_ex$`variable 3` <- as.logical(mydata_ex$`variable 3`)

mydata_ex

## ---- eval=FALSE---------------------------------------------------------
## load("mydata.RData")
## 
## load(file = "mydata.rda")
## 
## readRDS("mydata.rds")
## 
## readr::read_rds("mydata.rds")

