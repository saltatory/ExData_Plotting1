# Plots.R
#
# Purpose : Exploratory Data Analysis : Course Project 1
#   Loads and cleans the data prior to plotting
# 
# Author : Jeff Hohenstein

library(lubridate)
library(dplyr)

#dataFile <- "data/test.txt"
dataFile <- "data/household_power_consumption.txt"

# Load the UCI Machine Learning Power Consumption data set and return it as a data table
# See : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
getPowerConsumptionDataSet <- function() {
  if(!file.exists(dataFile))
    stop("Cannot find data set. Are you running this script in the correct directory?")
  
  data <- read.csv(dataFile, sep=";", header=TRUE, na.strings="?")
  
  # Convert to dplyr data table
  t <- tbl_df(data)
  
  # Convert strings to Dates/Times
  t <- t %>%
    mutate(Date = dmy(Date), Time = hms(Time)) %>%
    mutate(DateTime = Date + Time) %>%
    select(-Date,-Time)
  
  t
  
}

# Filter the data set down to the two days in question
filterPowerConsumptionDataSet <- function(data) {
  data %>% 
    filter(DateTime >= ymd("2007/02/01") & DateTime < ymd("2007/02/03"))
}
