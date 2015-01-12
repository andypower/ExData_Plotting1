# Coursera Exploratory Analysis: Second script plot2

# Reading data using the read.csv(..) function and reading only the usefull dates
# passing ; separator
# indicating column type
data <- read.csv("household_power_consumption.txt",
                 skip = 66636, 
                 nrows = 2880,
                 sep=";")

names(data) <- c("Date", "Time", "Global_active_power", 
                 "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3")

# Combining date colums
data$DateTime <- paste(data$Date, data$Time)

# Setting date format
data$DateTime <- strptime(data$DateTime, 
                          "%d/%m/%Y %H:%M:%S")

# Opening PNG file device and setting dimensions
png(file = "plot4.png", height=480, width=480)

# Set global graphical parameters
par(mfrow = c(2,2))

# Using plot function to draw Global Active Power line graph
plot(data$DateTime, data$Global_active_power, type = "lines", ylab = "Global Active Power", xlab = "")

# Using plot function to draw voltage line graph
plot(data$DateTime, data$Voltage, 
     type = "lines", 
     ylab = "Voltage", 
     xlab = "datetime")

# Using plot function to draw Sub Meterings over time.
plot(data$DateTime, data$Sub_metering_1, 
     type = "lines", 
     ylab = "Energy sub metering", 
     xlab = "")

with(data, lines(data$DateTime, data$Sub_metering_2, col = "red"))
with(data, lines(data$DateTime, data$Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "blue", "red"), 
       cex=0.8)

# Using plot function to draw Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type = "lines", ylab = "Global_reactive_power", xlab = "datetime")

# Closing PNG file device
dev.off()




