data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt",   sep = ";")
data$Time = strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

data[,3:dim(data)[2]] <- sapply(data[,3:dim(data)[2]], as.numeric)


#data$Time <- as.Date(data$Time,format="%H:%M:%S")

data <- data[(data$Date >= as.Date("2007-02-01") & data$Date < as.Date("2007-02-03")),]


with(data, plot(Global_active_power ~ as.POSIXct(Time), xaxt = "n", xlab = "" , ylab = "Global Active Power (kilowatt)", main="Global Active Power ", type="l"))

axis.POSIXct(1, x=data$Time, format="%a", labels = T)


dev.copy(png, file = "plot2.png")
dev.off()
