data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time <- paste(data2$Date, data2$Time, sep = " ")
data2$Time <- as.POSIXlt(data2$Time)

plot(data2$Time, data2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data2$Time, data2$Sub_metering_1)
lines(data2$Time, data2$Sub_metering_2, col = "red")
lines(data2$Time, data2$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty = 1, lwd = 2)

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
