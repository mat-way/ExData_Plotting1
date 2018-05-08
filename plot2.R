## Read all date from the file and create dataset with the name 'dtset'
dtset <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors = F, na.strings = '?')

## Create new column DateTime in the Date/Time class which contains data about Date and Time
dtset$DateTime <- strptime(paste(dtset$Date, dtset$Time), format="%d/%m/%Y %H:%M:%S")

## Create subset for two days in February, 2007
dtFeb2 <- subset(dtset, as.Date(dtset$DateTime) == '2007-02-01' | as.Date(dtset$DateTime) == '2007-02-02')

## Delete originally dataset for economy of memory
rm(dtset)

## Create png file for output results graphic
png("plot2.png", width = 480, height = 480)

## Set the format of graphic that we have only one graphic on the screen and in a file
par(mfrow = c(1, 1))

## Create graphic with labels
with(dtFeb2, plot(DateTime, Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab = '', lwd=2))

## Close png file
dev.off()