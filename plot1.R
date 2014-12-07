## Get the data
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 

## Filter the data based on two dates
date1 <- as.Date("2007/02/01", format = "%Y/%m/%d")
date2 <- as.Date("2007/02/02", format = "%Y/%m/%d")
filter <- data$Date == date1 | data$Date == date2
filtered_data <- data[filter,]

## Create histogram and save into a file
png("plot1.png", width=480, height=480, units="px")
hist(filtered_data$Global_active_power, 
     axes=F, 
     breaks =20, 
     xlim =c(0,6), 
     ylim=c(0,1300), 
     main="Global Active Power",
     col="red", 
     xlab="Global Active Power  (kilowatts)" )

axis(2)
axis(1, at=seq(0,6, by=2), labels=seq(0,6, by=2))
axis(2, at=seq(0,1200, by=200), labels=seq(0,1200, by=200), tick=F)
dev.off()


