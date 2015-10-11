Sys.setlocale("LC_ALL", "C")

#Read in the data 
#Please make sure that the household_power_consumption.txt file is in your working directory
hcp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert the Date variable into date class
hcp$Date <- as.character(hcp$Date)
hcp$Date <- as.Date(hcp$Date, format = "%d/%m/%Y")

#Subset only for values 2007/02/01 and 2007/02/02
hcp <- subset(hcp, Date =="2007-02-01" | Date == "2007-02-02")

#Plot the graph directly into png file
library(datasets)

png(file = "plot3.png", width = 480, height=480, type="windows")

with(hcp, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(hcp, lines(DateTime, Sub_metering_2, col = "red",  type = "l"))
with(hcp, lines(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()