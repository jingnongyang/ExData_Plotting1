data_electr <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

## Convert Date string to Date class.
date_col <- as.Date(data_electr$Date, "%d/%m/%Y")

## Select the rows corresponding to the 2 days.
date_selection <- date_col<=as.Date("2007-02-02") & date_col>=as.Date("2007-02-01")

data_electr_sel <- data_electr[date_selection,]

## Convert Date and Time to POSIXlt.
time_col <- strptime(paste(data_electr_sel$Date,data_electr_sel$Time),format="%d/%m/%Y %H:%M:%S")

## Generate figure.
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data_electr_sel, {
      plot(time_col, Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power", main="")
      plot(time_col, Voltage, type="l", col="black",ylab="Voltage", xlab="datetime")
      plot(time_col, data_electr_sel$Sub_metering_1,type="l",col="black",lty=1,xlab="",ylab="Energy sub metering")
      lines(time_col, data_electr_sel$Sub_metering_2,type="l",col="red",lty=1,xlab="",ylab="Energy sub metering")
      lines(time_col, data_electr_sel$Sub_metering_3,type="l",col="blue",lty=1,xlab="",ylab="Energy sub metering")
      legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1), bty="n")
      plot(time_col, Global_reactive_power, type="l", col="black", ylab="Global_reactive_power", xlab="datetime", main="")
})
dev.off()
