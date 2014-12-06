data_electr <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

## Convert Date string to Date class.
date_col <- as.Date(data_electr$Date, "%d/%m/%Y")

## Select the rows corresponding to the 2 days.
date_selection <- date_col<=as.Date("2007-02-02") & date_col>=as.Date("2007-02-01")

data_electr_sel <- data_electr[date_selection,]

## Convert Date and Time to POSIXlt.
time_col <- strptime(paste(data_electr_sel$Date,data_electr_sel$Time),format="%d/%m/%Y %H:%M:%S")

## Generate figure.
png(filename = "plot3.png", width = 480, height = 480)
plot(time_col, data_electr_sel$Sub_metering_1,type="l",col="black",lty=1,xlab="",ylab="Energy sub metering")
lines(time_col, data_electr_sel$Sub_metering_2,type="l",col="red",lty=1,xlab="",ylab="Energy sub metering")
lines(time_col, data_electr_sel$Sub_metering_3,type="l",col="blue",lty=1,xlab="",ylab="Energy sub metering")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
