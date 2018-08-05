# Exploratory data analysis: Peer-graded Assignment week 1
## Plot 3

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
png(filename = "plot3.png", width = 480, height = 480)

# Graph: Power by submeasurement
plot(power2007$DateTime, power2007$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")

# Overlay other sub meterings
lines(power2007$DateTime, power2007$Sub_metering_2, type = "l", col = "red")
lines(power2007$DateTime, power2007$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", legend = colnames(power2007[,7:9]), lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()