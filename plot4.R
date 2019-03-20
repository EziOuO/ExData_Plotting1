data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time <- paste(data2$Date, data2$Time, sep = " ")
data2$Time <- as.POSIXlt(data2$Time)

par(mfrow = c(2,2), mar = c(4, 4, 1, 2))
with(data2, plot(Time, as.numeric(Global_active_power), xlab = "", ylab = "Global Active Power", type = "l"))
plot(data2$Time, data2$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(data2$Time, data2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data2$Time, data2$Sub_metering_1)
lines(data2$Time, data2$Sub_metering_2, col = "red")
lines(data2$Time, data2$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2, cex = .8, bty = "n")
plot(data2$Time, data2$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()