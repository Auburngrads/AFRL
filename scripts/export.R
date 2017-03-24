## ----exportsetup, eval=F, echo=F-----------------------------------------
## source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ------------------------------------------------------------------------
df <- data.frame(var1 = c(10, 25, 8), 
                 var2 = c("beer", "wine", "cheese"), 
                          var3 = c(TRUE, TRUE, FALSE),
                 row.names = c("billy", "bob", "thornton"))

df

## ---- eval=FALSE---------------------------------------------------------
## # write to a csv file
## write.csv(df, file = "export_csv")
## 
## # write to a csv and save in a different directory
## write.csv(df, file = "/folder/subfolder/subsubfolder/export_csv")
## 
## # write to a csv file with added arguments
## write.csv(df, file = "export_csv", row.names = FALSE, na = "MISSING!")

## ---- eval=FALSE---------------------------------------------------------
## # write to a tab delimited text files
## write.delim(df, file = "export_txt")
## 
## # provides same results as read.delim
## write.table(df, file = "export_txt", sep="\t")

## ---- eval=FALSE---------------------------------------------------------
## library(readr)
## 
## # write to a csv file
## write_csv(df, path = "export_csv2")
## 
## # write to a csv and save in a different directory
## write_csv(df, path = "/folder/subfolder/subsubfolder/export_csv2")
## 
## # write to a csv file without column names
## write_csv(df, path = "export_csv2", col_names = FALSE)
## 
## # write to a txt file without column names
## write_delim(df, path = "export_txt2", col_names = FALSE)
## 
## # write to a csv with UTF-8 Byte order mark to indicate to Excel the csv is UTF-8 encoded
## write_excel_csv(df, path = "export_csv2", col_names = FALSE)

## ---- eval=FALSE---------------------------------------------------------
## library(xlsx)
## 
## # write to a .xlsx file
## write.xlsx(df, file = "output_example.xlsx")
## 
## # write to a .xlsx file without row names
## write.xlsx(df, file = "output_example.xlsx", row.names = FALSE)

## ---- eval=FALSE---------------------------------------------------------
## # create empty workbook
## multiple_df <- createWorkbook()
## 
## # create worksheets within workbook
## car_df <- createSheet(wb = multiple_df, sheetName = "Cars")
## iris_df <- createSheet(wb = multiple_df, sheetName = "Iris")
## 
## # add data frames to worksheets; for this example I use the
## # built in mtcars and iris data frames
## addDataFrame(x = mtcars, sheet = car_df)
## addDataFrame(x = iris, sheet = iris_df)
## 
## # save as a .xlsx file
## saveWorkbook(multiple_df, file = "output_example_2.xlsx")

## ---- eval=FALSE---------------------------------------------------------
## # create new workbook
## wb <- createWorkbook()
## 
## #--------------------
## # DEFINE CELL STYLES
## #--------------------
## # title and subtitle styles
## title_style <- CellStyle(wb) +
##                Font(wb, heightInPoints = 16,
##                     color = "blue",
##                     isBold = TRUE,
##                     underline = 1)
## 
## subtitle_style <- CellStyle(wb) +
##                   Font(wb, heightInPoints = 14,
##                        isItalic = TRUE,
##                        isBold = FALSE)
## 
## # data table styles
## rowname_style <- CellStyle(wb) +
##                  Font(wb, isBold = TRUE)
## 
## colname_style <- CellStyle(wb) +
##                  Font(wb, isBold = TRUE) +
##                  Alignment(wrapText = TRUE, horizontal = "ALIGN_CENTER") +
##                  Border(color = "black",
##                         position = c("TOP", "BOTTOM"),
##                         pen = c("BORDER_THIN", "BORDER_THICK"))
## 
## #-------------------------
## # CREATE & EDIT WORKSHEET
## #-------------------------
## # create worksheet
## Cars <- createSheet(wb, sheetName = "Cars")
## 
## # helper function to add titles
## xlsx.addTitle <- function(sheet, rowIndex, title, titleStyle) {
##         rows <- createRow(sheet, rowIndex = rowIndex)
##         sheetTitle <- createCell(rows, colIndex = 1)
##         setCellValue(sheetTitle[[1,1]], title)
##         setCellStyle(sheetTitle[[1,1]], titleStyle)
## }
## 
## # add title and sub title to worksheet
## xlsx.addTitle(sheet = Cars, rowIndex = 1,
##               title = "1974 Motor Trend Car Data",
##               titleStyle = title_style)
## 
## xlsx.addTitle(sheet = Cars, rowIndex = 2,
##               title = "Performance and design attributes of 32 automobiles",
##               titleStyle = subtitle_style)
## 
## # add data frame to worksheet
## addDataFrame(mtcars, sheet = Cars, startRow = 3, startColumn = 1,
##              colnamesStyle = colname_style,
##              rownamesStyle = rowname_style)
## 
## # change row name column width
## setColumnWidth(sheet = Cars, colIndex = 1, colWidth = 18)
## 
## # save workbook
## saveWorkbook(wb, file = "output_example_3.xlsx")

## ---- eval=FALSE---------------------------------------------------------
## # install.packages("devtools")
## devtools::install_github("kassambara/r2excel")
## library(r2excel)
## 
## # create new workbook
## wb <- createWorkbook()
## 
## # create worksheet
## Casualties <- createSheet(wb, sheetName = "Casualties")
## 
## # add title
## xlsx.addHeader(wb, sheet = Casualties,
##                value = "Road Casualties",
##                level = 1,
##                color = "red",
##                underline = 1)
## 
## # add subtitle
## xlsx.addHeader(wb, sheet = Casualties,
##                value = "Great Britain 1969-84",
##                level = 2,
##                color = "black")
## 
## # add author information
## author = paste("Author: Bradley C. Boehmke \n",
##              "Date: January 15, 2016 \n",
##              "Contact: xxxxx@gmail.com", sep = "")
## 
## xlsx.addParagraph(wb, sheet = Casualties,
##                   value = author,
##                   isItalic = TRUE,
##                   colSpan = 2,
##                   rowSpan = 4,
##                   fontColor = "darkgray",
##                   fontSize = 14)
## 
## # add hyperlink
## xlsx.addHyperlink(wb, sheet = Casualties,
##                   address = "http://bradleyboehmke.github.io/",
##                   friendlyName = "Vist my website", fontSize = 12)
## 
## xlsx.addLineBreak(sheet = Casualties, 1)
## 
## # add data frame to worksheet, I'm using the built in
## # Seatbelt data which you can view at data(Seatbelt)
## xlsx.addTable(wb, sheet = Casualties, data = Seatbelts, startCol = 2)
## 
## # save the workbook to an Excel file
## saveWorkbook(wb, file = "output_example_4.xlsx")

## ---- eval=FALSE---------------------------------------------------------
## # save() can be used to save multiple objects in you global environment,
## # in this case I save two objects to a .RData file
## x <- stats::runif(20)
## y <- list(a = 1, b = TRUE, c = "oops")
## save(x, y, file = "xy.RData")
## 
## # save.image() is just a short-cut for ‘save my current workspace’,
## # i.e. all objects in your global environment
## save.image()
## 
## # write rds file readr
## readr::write_rds(x, "x.rds")
## 
## # save a single object to file
## saveRDS(x, "x.rds")
## 
## # restore it under a different name
## x2 <- readRDS("x.rds")
## identical(x, x2)

