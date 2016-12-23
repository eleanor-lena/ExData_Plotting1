library(lubridate)

housedata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
housedata$Date <- dmy(housedata$Date)
selectdata <- housedata[housedata$Date == "2007-02-01"| housedata$Date =="2007-02-02",]

datetime <- strptime(paste(selectdata$Date, selectdata$Time), "%Y-%m-%d %H:%M:%S")
meter.1 <- as.numeric(selectdata$Sub_metering_1) 
meter.2 <- as.numeric(selectdata$Sub_metering_2)
meter.3 <- selectdata$Sub_metering_3

png("plot3.png", width = 480, height = 480)
par(mar = c(5,5,3,2))
plot(datetime, meter.1, type = "l", col = "black", ylab = "Energy sub metering",xlab = "", yaxt = "n")
axis(2, at = c(0,10,20,30), labels = c("0", "10", "20", "30"))
lines(datetime, meter.2, type = "l", col = "red")
lines(datetime, meter.3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()