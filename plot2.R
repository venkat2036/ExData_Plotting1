## Get the data
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 

## Filter the data based on two dates
date1 <- as.Date("2007/02/01", format = "%Y/%m/%d")
date2 <- as.Date("2007/02/02", format = "%Y/%m/%d")
filter <- data$Date == date1 | data$Date == date2
filtered_data <- data[filter,]

## Consolidate date and time
stringDateTime <- paste(filtered_data$Date, filtered_data$Time)
dateTime <- as.POSIXct(stringDateTime, format = "%Y-%m-%d %H:%M:%S")

## Plot the graph
png("plot2.png", width=480, height=480, units="px")
plot(dateTime, 
     filtered_data$Global_active_power,
     type="l", 
     xlab= "",
     ylab="Global Active Power (kilowatts)") 

dev.off()


