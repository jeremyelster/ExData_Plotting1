mydata = read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
str(mydata)

install.packages("lubridate")
library("lubridate")

mydata$Date <- dmy(mydata$Date)
period <-new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
febdata <- mydata[mydata$Date %within% period, ]

png("plot1.png", width = 480, height = 480)
hist(febdata$Global_active_power, 
     na.rm = TRUE, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()

