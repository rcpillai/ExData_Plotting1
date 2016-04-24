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
subset_data$Datetime <- as.POSIXct(datetime)
# Construct Plot 3
plot(subset_data$Sub_metering_1~data$Datetime, ylab="Energy sub metering", xlab="", type="l")
# Draw Lines
lines(subset_data$Sub_metering_2~data$Datetime,col="Red")
lines(subset_data$Sub_metering_3~data$Datetime, col="Blue")
# Draw Legend
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7)
# Create png file
dev.copy(png, file="plot3.png", width=480, height=480)
# Close 
dev.off()