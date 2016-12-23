housedata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
housedata$Date <- dmy(housedata$Date)
selectdata <- housedata[housedata$Date == "2007-02-01"| housedata$Date =="2007-02-02",]

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(5,4,4,2), oma = c(0,1,0,0))
#plot(1,1)
datetime <- strptime(paste(selectdata$Date, selectdata$Time), "%Y-%m-%d %H:%M:%S")
globalactivepower <- as.numeric(selectdata$Global_active_power)
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power", yaxt = "n")
axis(2,at = c(0,1000,2000,3000), labels = c(0,2,4,6))

#plot(1,2)
voltage <- as.numeric(selectdata$Voltage)
plot(datetime, voltage, type = "l", yaxt = "n")
axis(2, at = c(800, 1000, 1200,1400, 1600,1800,2000), labels = c("234", "236","238","240", "242", "244","246"), font = 10 )

#plot(2,1)
meter.1 <- as.numeric(selectdata$Sub_metering_1) 
meter.2 <- as.numeric(selectdata$Sub_metering_2)
meter.3 <- selectdata$Sub_metering_3

plot(datetime, meter.1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", yaxt = "n")
axis(2, at = c(0,10,20,30), labels = c("0", "10", "20", "30"))
lines(datetime, meter.2, type = "l", col = "red")
lines(datetime, meter.3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), cex = 0.75, bty = "n")

#plot(2,2)
globalreactivepower <- as.numeric(selectdata$Global_reactive_power)
plot(datetime, globalreactivepower, type = "l", ylab = "Global_reactive_power", yaxt = "n", ylim = c(0,260))
axis(2, at = seq(0,250, by = 50), labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))

dev.off()