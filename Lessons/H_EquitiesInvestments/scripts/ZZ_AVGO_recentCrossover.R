#' Author: Ted Kwartler
#' Date: 3-30-2020
#' Purpose: Simple Moving Avg Example As Indicator
#'

# Opts
options(scipen=999)

# Libs
library(TTR)
library(quantmod)
library(PerformanceAnalytics)

# Get Salesforce
getSymbols("AVGO") #"CRM_1_TTR_C.rds"

AVGOma50  <- SMA(AVGO$AVGO.Close, 50)
AVGOma200 <- SMA(AVGO$AVGO.Close, 200)

# Organize data
df        <- data.frame(AVGO$AVGO.Close, AVGOma50, AVGOma200)
names(df) <- c('AVGOlose', 'sma50', 'sma200')

df$Lag.1 <- Lag(ifelse(df$sma50 > df$sma200, 1, 0), k = 1) 

plot(tail(df$AVGOlose,150), type = 'l')
lines(tail(df$sma50, 150), col = 'blue')
lines(tail(df$sma200, 150), col = 'red')
