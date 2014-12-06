data_electr <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

date_col <- as.Date(data_electr$Date, "%d/%m/%Y")

date_selection <- date_col<=as.Date("2007-02-02") & date_col>=as.Date("2007-02-01")

data_electr_sel <- data_electr[date_selection,]

png(filename = "plot1.png", width = 480, height = 480)
hist(data_electr_sel$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
