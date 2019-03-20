data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time <- paste(data2$Date, data2$Time, sep = " ")
data2$Time <- as.POSIXlt(data2$Time)

with(data2, plot(Time, as.numeric(Global_active_power), xlab = "", ylab = "Global_active_power(kilowatts)", 
                 type = "l", main = "Global Active Power Vs Time"))

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
