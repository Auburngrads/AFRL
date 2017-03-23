
start.time <- as.POSIXlt('2016-11-08 12:00:00 EST')
end.time   <- as.POSIXct('2016-11-09 12:00:00 EST')

times <- seq(start.time, end.time, by = 300)

increments <- c(times[1], 
                rep(times[2:288], each = 2),
                times[289])

odd <- as.logical((1:length(increments))%%2)

intervals <- data.frame(begin = increments[odd],
                        end   = increments[!odd]) 



city <- 'Dayton, OH'
radius <- 50
date <- "2017-02-10"
term <- 'election'
n = 100

latlon  <- ggmap::geocode(city)
geocode <- paste(latlon[2],',',latlon[1],',',radius,'mi', sep = '')

twitter.data <- function(row) {
  
  since <- intervals[row,1]
  until <- intervals[row,2]
  
  twt.data <- searchTwitter(term, 
                n = n, 
                lang = "en",
                geocode = geocode, 
                since = gsub('EST','',since), 
                until = gsub('EST','',until))
  
  return(twt.data)
} 
