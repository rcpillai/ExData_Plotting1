# Read electric power consumption data in one household
full_data <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")
# Date format in the D/M/Y format
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")
# Get a subset of Data between "2007/02/01" and "2007/02/02"
subset_data  <- subset(full_data, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
# Remove the entire dataset
rm(full_data)
# Construct Plot 1
hist(subset_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# Create png file
dev.copy(png, file="plot1.png", width=480, height=480)
# Close  
dev.off()