data_file <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";") #Reads the File

data_file$Date <- as.Date(data_file$Date, format = "%d/%m/%Y")

data_file <- rbind(data_file[data_file$Date == "2007/02/01",], data_file[data_file$Date == "2007/02/02",]) #Restricts the Data Set by Dates

png("plot1.png", width=480, height=480)

data_file$Global_active_power <- as.numeric(as.character(data_file$Global_active_power))

hist(data_file$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="RED") ##Plots the Graph

dev.off()