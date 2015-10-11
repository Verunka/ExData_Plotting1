Sys.setlocale("LC_ALL", "C")

#Read in the data 
#Please make sure that the household_power_consumption.txt file is in your working directory
hcp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert the Date variable into date class
hcp$Date <- as.character(hcp$Date)
hcp$Date <- as.Date(hcp$Date, format = "%d/%m/%Y")

#Subset only for values 2007/02/01 and 2007/02/02
hcp <- subset(hcp, Date =="2007-02-01" | Date == "2007-02-02")

#Plot the histogram directly into png file
png(file = "plot1.png", width = 480, height=480, type="windows")

hist(hcp$Global_active_power, col = "red", ylim = c(0,1200),  main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
dev.off()