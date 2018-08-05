# Exploratory data analysis: Peer-graded Assignment week 1
## Plot 2

# Load library
library(dplyr)
library(tidyr)

# Read data from working directory
powerdata <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Select 2007-02-01 and 2007-02-02 dates
powerdata$Date <- as.character(powerdata$Date)
power2007 <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ]

# Create new column with data and time combined
power2007 <- mutate(power2007, DateTime = as.POSIXct(paste(power2007$Date, power2007$Time), format = "%d/%m/%Y %H:%M:%S"))

# Create plot
png(filename = "plot2.png", width = 480, height = 480)

# Graph: Global Active power per weekday
plot(power2007$DateTime, power2007$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()