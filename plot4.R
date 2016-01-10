
## the file is located in data directory
data.file <- "./data/household_power_consumption.txt"

## read the data into a table
data = read.table(data.file, sep=";", stringsAsFactors = FALSE, header = TRUE)

## Subset the data
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
submetering1 <- as.numeric(data.subset$Sub_metering_1);
submetering2 <- as.numeric(data.subset$Sub_metering_2);
submetering3 <- as.numeric(data.subset$Sub_metering_3);

volt <- as.numeric(data.subset$Voltage)
g.reactive.power <- as.numeric(data.subset$Global_reactive_power)

## convert date and time
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## open the file device and plot the image and close the device
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

##1
plot(datetime,g.active.power, type="l", xlab = "", ylab="Global Active Power")

##2
plot(datetime,volt, type="l", xlab="datetime", ylab="Voltage")


##3
plot(datetime,submetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,submetering2, type="l", col = "red" )
lines(datetime,submetering3, type="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black","red","blue"), bty = "n")

##4
plot(datetime,g.reactive.power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()