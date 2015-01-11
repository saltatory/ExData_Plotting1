# Plot 2
#
# Purpose : Exploratory Data Analysis : Course Project 1
#   Generate Plot 2
# 
# Author : Jeff Hohenstein

library(lubridate)
library(dplyr)
source("loadData.R")

# Generate a line plot of Global Active Power vs Days of the Week - Plot 2
#
# X : Day of the week
# Y : Global Active Power (kilowatts)
lineGlobalActivePower <- function(data) {
  with(data,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab=""))
  with(data,lines(DateTime,Global_active_power,type="l",lwd=1))
}

# Main - generate the graph and save it
data <- filterPowerConsumptionDataSet(getPowerConsumptionDataSet())
plot.new()
par(mfrow = c(1,1))
lineGlobalActivePower(data)
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()