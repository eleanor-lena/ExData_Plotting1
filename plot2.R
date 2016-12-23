library(lubridate)

housedata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
housedata$Date <- dmy(housedata$Date)
selectdata <- housedata[housedata$Date == "2007-02-01"| housedata$Date =="2007-02-02",]

datetime <- strptime(paste(selectdata$Date, selectdata$Time), "%Y-%m-%d %H:%M:%S")
globalactivepower <- as.numeric(selectdata$Global_active_power)
png("plot2.png", width = 480, height = 480)
par(mar = c(5,5,3,2))
plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power (kilowatts)",xlab = "", yaxt = "n")
axis(2,at = c(0,1000,2000,3000), labels = c(0,2,4,6))
dev.off()