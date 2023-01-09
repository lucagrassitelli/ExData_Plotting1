data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt",   sep = ";")
data$Time = strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

data[,3:dim(data)[2]] <- sapply(data[,3:dim(data)[2]], as.numeric)


#data$Time <- as.Date(data$Time,format="%H:%M:%S")

data <- data[(data$Date >= as.Date("2007-02-01") & data$Date < as.Date("2007-02-03")),]


par(mfrow = c(2,2))
with(data, plot(Global_active_power ~ as.POSIXct(Time), xaxt = "n", xlab = "" , ylab = "Global Active Power (kilowatt)", main="Global Active Power ", type="l"))
axis.POSIXct(1, x=data$Time, format="%a", labels = T)

plot(data$Voltage ~ as.POSIXct(data$Time), xaxt = "n", xlab = "datetime" , ylab = "Voltage", type="l"))
axis.POSIXct(1, x=data$Time, format="%a", labels = T)

plot(data$Sub_metering_1 ~ as.POSIXct(data$Time), xaxt = "n", xlab = "" , ylab = "Energy sub metering",type="l", lty=1)
lines(data$Sub_metering_2 ~ as.POSIXct(data$Time), xaxt = "n", type="l", col = "red", lty=1)
lines(data$Sub_metering_3 ~ as.POSIXct(data$Time), xaxt = "n", type="l", col = "blue", lty=1)
axis.POSIXct(1, x=data$Time, format="%a", labels = T)

with(data, plot(Global_active_power ~ as.POSIXct(Time), xaxt = "n", xlab = "" , ylab = "Global Active Power (kilowatt)", main="Global Active Power ", type="l"))
axis.POSIXct(1, x=data$Time, format="%a", labels = T)




axis.POSIXct(1, x=data$Time, format="%a", labels = T)
