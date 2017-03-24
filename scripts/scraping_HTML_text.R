## ----htmltextsetup, eval=!FALSE, echo=FALSE------------------------------
source(file.path(rprojroot::find_rstudio_root_file(),'setup','setup.R'))

## ----engine="block"------------------------------------------------------
<p>
This paragraph represents
a typical text paragraph
in HTML form
</p>

## ------------------------------------------------------------------------
library(rvest)

scraping_wiki <- read_html("https://en.wikipedia.org/wiki/Web_scraping")

scraping_wiki %>%
        html_nodes("h1")

## ------------------------------------------------------------------------
scraping_wiki %>%
        html_nodes("h1") %>%
        html_text()

## ------------------------------------------------------------------------
scraping_wiki %>%
        html_nodes("h2") %>%
        html_text()

## ------------------------------------------------------------------------
p_nodes <- scraping_wiki %>% 
        html_nodes("p")

length(p_nodes)

p_nodes[1:6]

p_text <- scraping_wiki %>%
        html_nodes("p") %>%
        html_text()

p_text[1]

## ------------------------------------------------------------------------
p_text[5]

p_text[6]

## ------------------------------------------------------------------------
ul_text <- scraping_wiki %>%
        html_nodes("ul") %>%
        html_text()

length(ul_text)

ul_text[1]

# read the first 200 characters of the second list
substr(ul_text[2], start = 1, stop = 200)

## ------------------------------------------------------------------------
li_text <- scraping_wiki %>%
        html_nodes("li") %>%
        html_text()

length(li_text)

li_text[1:8]

## ------------------------------------------------------------------------
li_text[104:136]

## ------------------------------------------------------------------------
all_text <- scraping_wiki %>%
        html_nodes("div") %>% 
        html_text()

## ------------------------------------------------------------------------
body_text <- scraping_wiki %>%
        html_nodes("#mw-content-text") %>% 
        html_text()

# read the first 207 characters
substr(body_text, start = 1, stop = 207)

# read the last 73 characters
substr(body_text, start = nchar(body_text)-73, stop = nchar(body_text))

## ------------------------------------------------------------------------
# Scraping a specific heading
scraping_wiki %>%
        html_nodes("#Techniques") %>% 
        html_text()

# Scraping a specific paragraph
scraping_wiki %>%
        html_nodes("#mw-content-text > p:nth-child(20)") %>% 
        html_text()

# Scraping a specific list
scraping_wiki %>%
        html_nodes("#mw-content-text > div:nth-child(22)") %>% 
        html_text()

# Scraping a specific reference list item
scraping_wiki %>%
        html_nodes("#cite_note-22") %>% 
        html_text()

## ------------------------------------------------------------------------
library(magrittr)

scraping_wiki %>%
        html_nodes("#mw-content-text > div:nth-child(22)") %>% 
        html_text()

scraping_wiki %>%
        html_nodes("#mw-content-text > div:nth-child(22)") %>% 
        html_text() %>% 
        strsplit(split = "\n") %>%
        unlist() %>%
        .[. != ""]

## ------------------------------------------------------------------------
library(stringr)

# read the last 700 characters
substr(body_text, start = nchar(body_text)-700, stop = nchar(body_text))

# clean up text
body_text %>%
        str_replace_all(pattern = "\n", replacement = " ") %>%
        str_replace_all(pattern = "[\\^]", replacement = " ") %>%
        str_replace_all(pattern = "\"", replacement = " ") %>%
        str_replace_all(pattern = "\\s+", replacement = " ") %>%
        str_trim(side = "both") %>%
        substr(start = nchar(body_text)-700, stop = nchar(body_text))

