# Read electric power consumption data in one household
full_data <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")
# Date format in the D/M/Y format
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")
# Get a subset of Data between "2007/02/01" and "2007/02/02"
subset_data <- subset(full_data, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
# Remove the entire dataset
rm(full_data)
# Convert dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)
# Construct Plot 2
plot(subset_data$Global_active_power~data$Datetime, ylab="Global Active Power (kilowatts)", xlab="", type="l")
# Create png file
dev.copy(png, file="plot2.png", width=480, height=480)
# Close  
dev.off()