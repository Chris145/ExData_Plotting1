data_file <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";") ##Gathers the File

##Converts formats
data_file$Date <- as.Date(data_file$Date, format = "%d/%m/%Y")

data_file$Time <- as.character(data_file$Time)

data_file$Time <- strptime(paste(data_file$Date, data_file$Time), "%Y-%m-%d %H:%M:%S")

##Restricts the Data
data_file <- rbind(data_file[data_file$Date == "2007/02/01",], data_file[data_file$Date == "2007/02/02",])

data_file$Global_active_power <- as.numeric(as.character(data_file$Global_active_power))

png("plot2.png", width=480, height=480)

with(data_file, plot(Time, Global_active_power, ylab = "Global Active Power (killowatts)", xlab="", pch="")) ##Plots the Graph

lines(data_file$Time, data_file$Global_active_power) ##Drawns the line

dev.off()