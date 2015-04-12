data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
data_sub$Date_Time <- paste(data_sub$Date, data_sub$Time)
data_sub$Date_Time <- strptime(data_sub$Date_Time, format = "%d/%m/%Y %H:%M:%S")
png("plot3.PNG", width = 480, height = 480)
plot <- plot(data_sub$Date_Time, data_sub$Sub_metering_1, type = "l",
             ylab = "Energy sub metering", xlab = "", col = "black")
lines(data_sub$Date_Time, data_sub$Sub_metering_2, type = "l",
      ylab = "Energy sub metering", xlab = "", col = "red")
lines(data_sub$Date_Time, data_sub$Sub_metering_3, type = "l",
      ylab = "Energy sub metering", xlab = "", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()