
## Read all date from the file and create dataset with the name 'dtset'
dtset <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors = F, na.strings = '?')

## Convert column Date in the Date/Time class
dtset$Date <- as.Date(dtset$Date, '%d/%m/%Y')

## Create subset for two days in February, 2007
dtFeb2 <- subset(dtset, dtset$Date == '2007-02-01' | dtset$Date == '2007-02-02')

## Delete originally dataset for economy of memory
rm(dtset)

## Create png file for output results graphic
png("plot1.png", width = 480, height = 480)

## Set the format of histogram that we have only one graphic on the screen and in a file
par(mfrow = c(1, 1))

## Create histogram with right color, and labels
with(dtFeb2, hist(Global_active_power, col='red', main='Global Active Power', xlab = 'Global Active Power (kilowatts)'))

## Close png file
dev.off()