library(tseries)
library(quantmod)
library(XML)


startDate <- "2005-01-01"
tables <- readHTMLTable("http://en.wikipedia.org/wiki/List_of_S%26P_500_companies")
#oddly this is not working for me. I get failed to laod error
tickers <- as.matrix(tables[[1]]["Ticker symbol"])

instrumentRtn <- function(instrument=instrument,startDate=startDate,lag=lag){
  price <- get.hist.quote(instrument, quote="Adj", start=startDate, retclass="zoo")
  monthlyPrice <- aggregate(price, as.yearmon, tail, 1)
  monthlyReturn <- diff(log(monthlyPrice),lag=lag)
  monthlyReturn <- exp(monthlyReturn)-1
  return(monthlyReturn)
}

dataFactor <- list()
dataRtn <- list()

for (i in 1:length(tickers)) {
  print(tickers[i])
  dataFactor[[i]] <- instrumentRtn(tickers[i],startDate,lag=12)
  dataRtn[[i]] <- instrumentRtn(tickers[i],startDate,lag=1)
  
  
}