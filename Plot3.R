library(dplyr)

# Import the data and get the relevant rows
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep = ';')
dataset <- filter(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dataset$Global_active_power <- as.numeric(dataset$Sub_metering_1)
dataset$Global_active_power <- as.numeric(dataset$Sub_metering_2)
dataset$Global_active_power <- as.numeric(dataset$Sub_metering_3)

# Adding a column with the date and time as a single Date object.
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time),
			     format = '%d/%m/%Y %H:%M:%S')

png(filename = 'Plot3.png')

with(dataset, plot(DateTime, Sub_metering_1, 
		   type = 'n',
		   xlab = '',
		   ylab = 'Energy sub metering'))
lines(dataset$DateTime, dataset$Sub_metering_1, col = 'black')
lines(dataset$DateTime, dataset$Sub_metering_2, col = 'red')
lines(dataset$DateTime, dataset$Sub_metering_3, col = 'blue')

legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_Metering_3'),
       col = c('black', 'red', 'blue'),
       lty = 1)

dev.off()