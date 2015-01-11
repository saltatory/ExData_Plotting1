# Plot 4
#
# Purpose : Exploratory Data Analysis : Course Project 1
#   Generate Plot 4
#   2 of these plots are "almost" identical to Plots 1-3 but I recreated them to be sure
# 
# Author : Jeff Hohenstein

# Generate a histogram of Global Active Power - Plot 1
# X : Global Active Power in kilowatts
# Y : Frequency
histGlobalActivePower <- function(data) {
  with(data,hist(Global_active_power, col="red", title="Global Active Power", xlab="Global Active Power (kilowatts)"))
}

# Generate a line plot of Global Active Power vs Days of the Week - Plot 2
#
# X : Day of the week
# Y : Global Active Power (kilowatts)
lineGlobalActivePower <- function(data) {
  with(data,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power", xlab=""))
  with(data,lines(DateTime,Global_active_power,type="l",lwd=1))
}

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
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1), bty="n")
}

# Generate a line graph of voltage by day
lineVoltage <- function(data) {
  with(data,plot(DateTime,Voltage,type="n",ylab="Voltage", xlab="datetime"))
  with(data,lines(DateTime,Voltage,type="l",lwd=1,col="black"))
}

# Generate a line graph of reactive power by day
lineGlobalReactivePower <- function(data) {
  with(data,plot(DateTime,Global_reactive_power,type="n",ylab="Global_reactive_power", xlab="datetime"))
  with(data,lines(DateTime,Global_reactive_power,type="l",lwd=1,col="black"))
}

# Generator 4 plots in a grid - Plot 4
#
# Plot 1 - Global Active Power by day
# Plot 2 - Voltage by day
# Plot 3 - Energy sub metering by day
# Plot 4 - Global reactive power by day
plotMultiple <- function(data) {
  par(mfrow=c(2,2))
  lineGlobalActivePower(data)
  lineVoltage(data)
  lineSubMetering(data)
  lineGlobalReactivePower(data)
}

# Main - Plot all 4 and save
data <- filterPowerConsumptionDataSet(getPowerConsumptionDataSet())
png("plot4.png",width=480,height=480,pointsize=10)
plotMultiple(data)
dev.off()