# Set working directory
setwd("./")

# Read in dataset
dat <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)


# Subset dataset
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

# Generate a new variable via variables Date and Time
dat$Day <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# Plot 3

png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

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
        lty = 1,
        col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()