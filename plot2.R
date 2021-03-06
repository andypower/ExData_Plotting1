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
png(file = "plot2.png", height=480, width=480)

# Set global graphical parameters
par(mfrow = c(1,1))

# Using plot function
plot(data$DateTime, data$Global_active_power, 
     type = "lines", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

# Closing PNG file device
dev.off()