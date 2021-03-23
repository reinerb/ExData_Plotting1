library(dplyr)

# Import the data and get the relevant rows
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep = ';')
dataset <- filter(dataset, Date == '1/2/2007' | Date == '2/2/2007')
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

png(filename = 'Plot1.png')

hist(dataset$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     col = 'red')

dev.off()