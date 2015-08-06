mydata = read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
str(mydata)

install.packages("lubridate")
library("lubridate")

mydata$Date <- dmy(mydata$Date)
period <-new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
febdata <- mydata[mydata$Date %within% period, ]
times <- as.POSIXct(paste(febdata$Date, febdata$Time))

png("plot2.png", height = 480, width = 480)
with(febdata, plot(times, febdata$Global_active_power,
                   type = "l",
                   ylab = "Global Active Power (kilowatts)",
                   xlab = ""))
dev.off()

