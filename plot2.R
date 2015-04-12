data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Time, Global_active_power))
data_sub$Date_Time <- paste(data_sub$Date, data_sub$Time)
data_sub$Date_Time <- strptime(data_sub$Date_Time, format = "%d/%m/%Y %H:%M:%S")
png("plot2.PNG", width = 480, height = 480)
plot <- plot(data_sub$Date_Time, data_sub$Global_active_power, type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = "" )
dev.off()