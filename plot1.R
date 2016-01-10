## the file is located in data directory
data.file <- "./data/household_power_consumption.txt"

## read the data into a table
data = read.table(data.file, sep=";", stringsAsFactors = FALSE, header = TRUE)

## Subset the data
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
g.active.power <- as.numeric(data.subset$Global_active_power);

## open the file device and plot the image and close the device
png("plot1.png", width = 480, height = 480)
hist(g.active.power, col="red", main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()