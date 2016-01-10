
## the file is located in data directory
data.file <- "./data/household_power_consumption.txt"

## read the data into a table
data = read.table(data.file, sep=";", stringsAsFactors = FALSE, header = TRUE)

## Subset the data
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
g.active.power <- as.numeric(data.subset$Global_active_power);

## convert date and time
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## open the file device and plot the image and close the device
png("plot2.png", width = 480, height = 480)
plot(datetime,g.active.power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()