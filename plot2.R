data_electr <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

## Convert Date string to Date class.
date_col <- as.Date(data_electr$Date, "%d/%m/%Y")

## Select the rows corresponding to the 2 days.
date_selection <- date_col<=as.Date("2007-02-02") & date_col>=as.Date("2007-02-01")

data_electr_sel <- data_electr[date_selection,]

## Convert Date and Time to POSIXlt.
time_col <- strptime(paste(data_electr_sel$Date,data_electr_sel$Time),format="%d/%m/%Y %H:%M:%S")

## Generate figure.
png(filename = "plot2.png", width = 480, height = 480)
plot(time_col, data_electr_sel$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power (kilowatts)", main="")
dev.off()
