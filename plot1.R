# Set working directory
setwd("./")

# Read in dataset
dat <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)


# Subset dataset
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

# Generate a new variable via variables Date and Time
dat$Day <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# Plot 1

png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

hist(dat$Global_active_power, 
     col = "red",
     xlab = "Global active power (kilowatts)",
     main = "Global Active Power")

dev.off()