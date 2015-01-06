# Set working directory
setwd("./")

# Read in dataset
dat <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)


# Subset dataset
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

# Generate a new variable via variables Date and Time
dat$Day <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# Plot 4

png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow = c(2,2))


## sub_plot1
plot(dat$Day, dat$Global_active_power,
     xlab = "",
     type = "n",
     ylab = "Global active power (kilowatts)")

lines(dat$Day, dat$Global_active_power, type = "s")


## sub_plot2
plot(dat$Day, dat$Voltage, 
     type = "n",
     xlab = "datetime",
     ylab = "Voltage")

lines(dat$Day, dat$Voltage, type = "s")


## sub_plot3
plot(dat$Day, dat$Sub_metering_1,
     xlab = "",
     type = "l",
     ylab = "Energy sub metering")

lines(dat$Day, dat$Sub_metering_2,
      type = "l",
      col = "red")

lines(dat$Day, dat$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright",
       cex = 0.75,
       lty = 1,
       bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## sub_plot4
plot(dat$Day, dat$Global_reactive_power, 
     type = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power")

lines(dat$Day, dat$Global_reactive_power, type = "s")

dev.off()