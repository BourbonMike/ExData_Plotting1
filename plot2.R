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
png(file = "plot2.png")

##  Create the plot
plot((power$Date + power$Time) , power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()