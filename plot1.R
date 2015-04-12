data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(Global_active_power))
png("plot1.PNG", width = 480, height = 480)
plot <- hist(data_sub$Global_active_power,
             freq = TRUE, col="red", 
             main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()