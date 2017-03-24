## ----htmltablesetup, eval=!FALSE, echo=FALSE-----------------------------
source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ------------------------------------------------------------------------
library(rvest)

rvest.doc <- read_html("http://www.bls.gov/web/empsit/cesbmart.htm")

tbls <- html_nodes(rvest.doc, "table")

head(tbls)

## ------------------------------------------------------------------------
# subset list of table nodes for items 3 & 4
tbls_ls <- rvest.doc %>%
        html_nodes("table") %>%
        .[3:4] %>%
        html_table(fill = TRUE)

str(tbls_ls)

## ------------------------------------------------------------------------
# empty list to add table data to
tbls2_ls <- list()

# scrape Table 2. Nonfarm employment...
tbls2_ls$Table1 <- rvest.doc %>%
        html_nodes("#Table2") %>% 
        html_table(fill = TRUE) %>%
        .[[1]]

# Table 3. Net birth/death...
tbls2_ls$Table2 <- rvest.doc %>%
        html_nodes("#Table3") %>% 
        html_table() %>%
        .[[1]]

str(tbls2_ls)

## ------------------------------------------------------------------------
head(tbls2_ls[[1]], 4)

# remove row 1 that includes part of the headings
tbls2_ls[[1]] <- tbls2_ls[[1]][-1,]

# rename table headings
colnames(tbls2_ls[[1]]) <- c("CES_Code", "Ind_Title", "Benchmark",
                            "Estimate", "Amt_Diff", "Pct_Diff")

head(tbls2_ls[[1]], 4)

## ------------------------------------------------------------------------
library(XML)

url <- "http://www.bls.gov/web/empsit/cesbmart.htm"

get <- httr::GET(url = url)
content <- httr::content(get, encoding = "ISO-8859-1")
xml.doc <- XML::htmlTreeParse(content, useInternalNodes = T)

## ------------------------------------------------------------------------
# read in HTML data
tbls_xml <- readHTMLTable(xml.doc)

typeof(tbls_xml)

length(tbls_xml)

## ------------------------------------------------------------------------
head(tbls_xml[[3]])

head(tbls_xml[[4]], 3)

## ------------------------------------------------------------------------
# only parse the 3rd and 4th tables
emp_ls <- readHTMLTable(xml.doc, which = c(3, 4))

str(emp_ls)

## ------------------------------------------------------------------------
library(RCurl)

# Retreive content from url
rcurl.doc <- getURL(url, 
                    .opts = curlOptions(followlocation = TRUE))
# parse url
url_parsed <- htmlParse(rcurl.doc, asText = TRUE)

# select table nodes of interest
tableNodes <- getNodeSet(url_parsed, c('//*[@id="Table2"]', '//*[@id="Table3"]'))

# convert HTML tables to data frames
bls_table2 <- readHTMLTable(tableNodes[[1]])
bls_table3 <- readHTMLTable(tableNodes[[2]])

head(bls_table2)

head(bls_table3, 3)

## ------------------------------------------------------------------------
bls_table2 <- 
  readHTMLTable(tableNodes[[1]], 
                header = c("CES_Code", "Ind_Title", 
                           "Benchmark", "Estimate", 
                           "Amt_Diff", "Pct_Diff"))

head(bls_table2)

## ------------------------------------------------------------------------
str(bls_table3)

bls_table3 <- 
  readHTMLTable(tableNodes[[2]], 
                colClasses = c("character",
                               "character", 
                               rep("integer", 10)))

str(bls_table3)

