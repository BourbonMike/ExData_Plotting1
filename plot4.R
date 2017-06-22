## Plot 1

## Load required packages 
library(sqldf)
library(lubridate)

##  Read in data using the sqldf package selecting only Feb 1 & 2, 2007
power <- read.csv.sql("household_power_consumption.txt", sep = ";", 
                      sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

## Using lubridate, convert the Date and Time variables to date and time objects
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)


##  Open the device
png(file = "plot4.png")

## Set up to display 4 charts, row by row
par(mfrow = c(2, 2))

##  Create the plot
plot((power$Date + power$Time) , power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot((power$Date + power$Time), power$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot((power$Date + power$Time), power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points((power$Date + power$Time), power$Sub_metering_1, type = "l")
points((power$Date + power$Time), power$Sub_metering_2, type = "l", col = "red")
points((power$Date + power$Time), power$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = "--", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot((power$Date + power$Time), power$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()