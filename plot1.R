# Plot 1
#
# Purpose : Exploratory Data Analysis : Course Project 1
#   Generates and saves Plot 1
# Author : Jeff Hohenstein

library(lubridate)
library(dplyr)
source("loadData.R")

# Generate a histogram of Global Active Power - Plot 1
# X : Global Active Power in kilowatts
# Y : Frequency
histGlobalActivePower <- function(data) {
  with(data,hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
}

# Main - generate the graph and save it
data <- filterPowerConsumptionDataSet(getPowerConsumptionDataSet())
plot.new()
par(mfrow = c(1,1))
histGlobalActivePower(data)
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()