library(dplyr)

# Import the data and get the relevant rows
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep = ';')
dataset <- filter(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

# Adding a column with the date and time as a single Date object.
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time),
			     format = '%d/%m/%Y %H:%M:%S')

png(filename = 'Plot2.png')

with(dataset, plot(DateTime, Global_active_power, 
		   type = 'n',
		   xlab = '',
		   ylab = 'Global Active Power (kilowatts)'))
lines(dataset$DateTime, dataset$Global_active_power)


dev.off()