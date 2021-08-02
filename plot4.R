#Creates the FOURTH plot in programming assignment #1

########################################
# Load the needed libraries
########################################

library(dplyr)
library(lubridate)


########################################
# LOad and filter data, combine Date and Time
########################################

data <- read_csv2("household_power_consumption.txt")
data$Date <- dmy(data$Date)

data_to_plot <- data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
data_to_plot$Global_active_power <- as.numeric(data_to_plot$Global_active_power)
data_to_plot$DateTime <- as.POSIXct(paste(data_to_plot$Date, data_to_plot$Time), 
                                    format = "%Y-%m-%d %H:%M:%S")

########################################
# Create Plot 2 and save in png file
########################################

png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

#plot 1
plot(data_to_plot$DateTime, data_to_plot$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")


#plot 2
plot(data_to_plot$DateTime, data_to_plot$Voltage, type = "l", 
     xlab = "", ylab = "Voltage")

#plot 3
plot(data_to_plot$DateTime, data_to_plot$Sub_metering_1, type = "l",
     ylab = "Energy Sub Metering", xlab = "")
lines(data_to_plot$DateTime, data_to_plot$Sub_metering_2, col = "red")
lines(data_to_plot$DateTime, data_to_plot$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1))

#plot 4
plot(data_to_plot$DateTime, data_to_plot$Global_reactive_power, type = "l",
     xlab = "DateTime", ylab = "Global_Reactive_Power")

dev.off()
