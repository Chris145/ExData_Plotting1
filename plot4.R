data_file <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";") #Gathers the File

data_file$Date <- as.Date(data_file$Date, format = "%d/%m/%Y")

data_file$Time <- as.character(data_file$Time)

data_file$Time <- strptime(paste(data_file$Date, data_file$Time), "%Y-%m-%d %H:%M:%S")

data_file <- rbind(data_file[data_file$Date == "2007/02/01",], data_file[data_file$Date == "2007/02/02",])

#Converts the Data
data_file$Sub_metering_1 <- as.numeric(as.character(data_file$Sub_metering_1))
data_file$Sub_metering_2 <- as.numeric(as.character(data_file$Sub_metering_2))
data_file$Sub_metering_3 <- as.numeric(as.character(data_file$Sub_metering_3))
data_file$Global_active_power <- as.numeric(as.character(data_file$Global_active_power))
data_file$Global_reactive_power <- as.numeric(as.character(data_file$Global_reactive_power))
data_file$Voltage <- as.numeric(as.character(data_file$Voltage))

combinedTime <- c(data_file$Time, data_file$Time, data_file$Time)
combinedData <- c(data_file$Sub_metering_1, data_file$Sub_metering_2, data_file$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) #Ensures 4 graphs are displayed


#Plots Graph 1
with(data_file, plot(Time, Global_active_power, ylab = "Global Active Power", xlab="", pch=""))
lines(data_file$Time, data_file$Global_active_power)

#Plots Graph 2
with(data_file, plot(Time, Voltage, ylab = "Voltage", xlab="datetime", pch=""))
lines(data_file$Time, data_file$Voltage)

#Plots Graph 3
with(data_file, plot(combinedTime, combinedData, ylab = "Energy sub metering", xlab="", pch=""))
lines(data_file$Time, data_file$Sub_metering_1)
lines(data_file$Time, data_file$Sub_metering_2, col="RED")
lines(data_file$Time, data_file$Sub_metering_3, col="BLUE")
legend("topright", pch="-", col = c("black", "red", "blue"), lwd=2, , bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plots Graph 4
with(data_file, plot(Time, Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", pch=""))
lines(data_file$Time, data_file$Global_reactive_power)

dev.off()
