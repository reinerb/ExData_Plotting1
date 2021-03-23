library(dplyr)

# Import the data and get the relevant rows
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep = ';')
dataset <- filter(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
dataset$Voltage <- as.numeric(dataset$Voltage)
dataset$Global_reactive_power <- as.numeric(dataset$Global_reactive_power)

# Adding a column with the date and time as a single object.
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time),
			     format = '%d/%m/%Y %H:%M:%S')

png(filename = 'Plot4.png')

# Using mfcol instead of mfrow to reuse the plots from Plot2 and Plot3 first.
par(mfcol = c(2,2))

# Upper left
with(dataset, plot(DateTime, Global_active_power, 
		   type = 'n',
		   xlab = '',
		   ylab = 'Global Active Power (kilowatts)'))
lines(dataset$DateTime, dataset$Global_active_power)

# Lower left
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

# Upper right
with(dataset, plot(DateTime, Voltage,
		   type = 'n',
		   xlab = '',
		   ylab = 'Voltage'))
lines(dataset$DateTime, dataset$Voltage)

# Lower right
with(dataset, plot(DateTime, Global_reactive_power,
		   type = 'n',
		   xlab = '',
		   ylab = 'Global reactive power'))
lines(dataset$DateTime, dataset$Global_reactive_power)

dev.off()