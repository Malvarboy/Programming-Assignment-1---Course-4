#Creates the SECOND plot in programming assignment #1

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

png("plot2.png",width = 480, height = 480)
plot(data_to_plot$DateTime, data_to_plot$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
