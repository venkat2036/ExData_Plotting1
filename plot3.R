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
png("plot3.png", width=480, height=480, units="px")
plot(dateTime, 
     filtered_data$Sub_metering_1,
     type="l", 
     xlab= "",
     ylab="Energy sub Metering") 

lines(dateTime, 
      filtered_data$Sub_metering_2,
      type="l", 
      lwd="1", col ="red")

lines(dateTime, 
      filtered_data$Sub_metering_3,
      type="l", 
      lwd="1", col ="blue")

legend('topright',
       'groups',
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c('black','red','blue'),
       lty = c(1,1,1), 
       bty ="o")

dev.off()


