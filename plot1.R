# Script for making graph 1

FILENAME = "household_power_consumption.txt"

fulldata <- read.table(FILENAME, header=TRUE, sep=";")
fulldata$Date <- as.character(fulldata$Date)
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")
data <- subset(fulldata, fulldata$Date==as.Date("2007-02-01") | fulldata$Date==as.Date("2007-02-02"))
data$Time <- as.character(data$Time)
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S", tz="CET")
data <- cbind(data, datetime)

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
