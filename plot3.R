mydata = read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
str(mydata)

install.packages("lubridate")
library("lubridate")

mydata$Date <- dmy(mydata$Date)
period <-new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
febdata <- mydata[mydata$Date %within% period, ]
times <- as.POSIXct(paste(febdata$Date, febdata$Time))

head(febdata)

png("plot3.png", width = 480, height = 480)
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
       col = c("black", "red", "blue"))
title(ylab = "Energy sub metering")
dev.off()
