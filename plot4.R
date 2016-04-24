# Read electric power consumption data in one household
full_data <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")
# Date format in the D/M/Y format
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")
# Get a subset of Data between "2007/02/01" and "2007/02/02"
subset_data  <- subset(full_data, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
# Remove the entire dataset
rm(full_data)
# Convert dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
data$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# Combine all plots
# Construct Plot 1
plot(subset_data$Global_active_power ~ data$Datetime, ylab="Global Active Power", type="l", xlab="")
# Construct Plot 2
plot(subset_data$Voltage ~ data$Datetime, ylab="Voltage", type="l", xlab="datetime")
# Construct Plot 3
plot(subset_data$Sub_metering_1~data$Datetime, ylab="Engergy sub metering", xlab="", type="l")
# Draw Lines
lines(subset_data$Sub_metering_2~data$Datetime, col="Red")
lines(subset_data$Sub_metering_3~data$Datetime, col="Blue")
# Draw Legend
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7, bty="n")
# Construct Plot 4
plot(subset_data$Global_reactive_power~data$Datetime, type="l", ylab="Global Reactive Power", xlab="datetime")
# Create png file
dev.copy(png, file="plot4.png", height=480, width=480)
# Close 
dev.off()