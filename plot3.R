data_file <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";") #Gathers the File

data_file$Date <- as.Date(data_file$Date, format = "%d/%m/%Y")

data_file$Time <- as.character(data_file$Time)

data_file$Time <- strptime(paste(data_file$Date, data_file$Time), "%Y-%m-%d %H:%M:%S")

##Restricts the Data
data_file <- rbind(data_file[data_file$Date == "2007/02/01",], data_file[data_file$Date == "2007/02/02",]) 

data_file$Sub_metering_1 <- as.numeric(as.character(data_file$Sub_metering_1))
data_file$Sub_metering_2 <- as.numeric(as.character(data_file$Sub_metering_2))
data_file$Sub_metering_3 <- as.numeric(as.character(data_file$Sub_metering_3))

combinedTime <- c(data_file$Time, data_file$Time, data_file$Time)
combinedData <- c(data_file$Sub_metering_1, data_file$Sub_metering_2, data_file$Sub_metering_3)

png("plot3.png", width=480, height=480)

#Plots the Graph
with(data_file, plot(combinedTime, combinedData, ylab = "Energy sub metering", xlab="", pch=""))

#Draws the Lines
lines(data_file$Time, data_file$Sub_metering_1)
lines(data_file$Time, data_file$Sub_metering_2, col="RED")
lines(data_file$Time, data_file$Sub_metering_3, col="BLUE")

#Adds the Legend
legend("topright", pch="-", col = c("black", "red", "blue"), lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()



