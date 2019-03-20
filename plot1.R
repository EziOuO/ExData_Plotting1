data <- read.csv(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

hist(as.numeric(data2$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
