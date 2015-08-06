mydata = read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
str(mydata)

install.packages("lubridate")
library("lubridate")

mydata$Date <- dmy(mydata$Date)
period <-new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
febdata <- mydata[mydata$Date %within% period, ]
times <- as.POSIXct(paste(febdata$Date, febdata$Time))

png("plot4.png", height = 480, width= 480)
par(mfrow = c(2,2))
#plot1
with(febdata, plot(times, Global_active_power,
                   type = "l",
                   ylab = "Global Active Power (kilowatts)",
                   xlab = ""))
#plot2
with(febdata, plot(times, Voltage,
                   type = "l",
                   ylab = "Voltage",
                   xlab = "datetime"))
#plot3
with(febdata, plot(times, Sub_metering_1,
                   type = "l",
                   xlab = "",
                   ylab = ""))
with(febdata, lines(times, Sub_metering_2,
                    col = "red",
                    xlab = "",
                    ylab = ""))
with(febdata, lines(times, Sub_metering_3,
                    col = "blue",
                    xlab = "",
                    ylab = ""))
legend("topright", 
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       bty = "n")
title(ylab = "Energy sub metering")
#plot4
with(febdata, plot(times, Global_reactive_power,
                   type = "l",
                   xlab = "datetime"))
dev.off()