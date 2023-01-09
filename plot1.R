data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt",   sep = ";")
data$Time = strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

data[,3:dim(data)[2]] <- sapply(data[,3:dim(data)[2]], as.numeric)


#data$Time <- as.Date(data$Time,format="%H:%M:%S")

data <- data[(data$Date >= as.Date("2007-02-01") & data$Date < as.Date("2007-02-03")),]

names(data)

hist(data$Global_active_power, xlab = "Global Active Power (kilowatt)", col = "Red", main="Global Active Power ")
dev.copy(png, file = "plot1.png")
dev.off()
