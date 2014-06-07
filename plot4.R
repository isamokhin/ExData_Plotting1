# Script for making graph 4

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

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
plot(data$datetime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
with(data, plot(datetime, Sub_metering_1, type="l",col="Black", ylab="Energy sub metering",xlab=""))
with(data, lines(datetime, Sub_metering_2, type="l",col="Red",ylab="Energy sub metering",xlab=""))
with(data, lines(datetime, Sub_metering_3, type="l",col="Blue",ylab="Energy sub metering",xlab=""))
legend("topright", colnames(data)[7:9], lty=1, col=c("Black", "Red", "Blue"))
plot(data$datetime, data$Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)",xlab="datetime")
dev.off()
