## Read all date from the file and create dataset with the name 'dtset'
dtset <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors = F, na.strings = '?')

## Create new column DateTime in the Date/Time class which contains data about Date and Time
dtset$DateTime <- strptime(paste(dtset$Date, dtset$Time), format="%d/%m/%Y %H:%M:%S")

## Create subset for two days in February, 2007
dtFeb2 <- subset(dtset, as.Date(dtset$DateTime) == '2007-02-01' | as.Date(dtset$DateTime) == '2007-02-02')

## Delete originally dataset for economy of memory
rm(dtset)


## Create png file for output results graphic
png("plot4.png", width = 480, height = 480)

## Set the format of graphic that we have only one graphic on the screen and in a file
par(mfrow = c(2, 2))

## Create graphic with labels for top left
with(dtFeb2, plot(DateTime, Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab = '', lwd=2))

## Create graphic with labels for top right
with(dtFeb2, plot(DateTime, Voltage, type ='l', xlab='datetime'))

## Create graphic for bottom left
with(dtFeb2, plot(DateTime, Sub_metering_1, type="l", xlab = '', ylab = "Energy sub metering", ylim = c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3))))
with(dtFeb2, points(DateTime, Sub_metering_2, col = 'red', type = 'l'))
with(dtFeb2, points(DateTime, Sub_metering_3, col = 'blue', type = 'l'))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Create graphic for bottom right
with(dtFeb2, plot(DateTime, Global_reactive_power, type ='l', xlab='datetime'))

## Close png file
dev.off()