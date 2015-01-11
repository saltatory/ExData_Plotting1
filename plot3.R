# Plot 3
#
# Purpose : Exploratory Data Analysis : Course Project 1
#   Generate Plot 3
# 
# Author : Jeff Hohenstein

source("loadData.R")
# Generate a plot with multiple lines for sub metering values - Plot 3
#
# X : Day of the week
# Y1 : Sub_metering_1
# Y2 : Sub_metering_2
# Y3 : Sub_metering_3
lineSubMetering <- function(data) {
  with(data,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering", xlab=""))
  with(data,lines(DateTime,Sub_metering_1,type="l",lwd=1,col="black"))
  with(data,lines(DateTime,Sub_metering_2,type="l",lwd=1,col="red"))
  with(data,lines(DateTime,Sub_metering_3,type="l",lwd=1,col="blue"))
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
}

# Main - generate the plot and save it
data <- filterPowerConsumptionDataSet(getPowerConsumptionDataSet())
png("plot3.png",width=480,height=480)
par(mfrow = c(1,1))
lineSubMetering(data)
dev.off()