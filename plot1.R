#Creates the FIRST plot in programming assignment #1

########################################
# Load the needed libraries
########################################

library(dplyr)
library(lubridate)


########################################
# LOad and filter data
########################################

data <- read_csv2("household_power_consumption.txt")
data$Date <- dmy(data$Date)

data_to_plot <- data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
data_to_plot$Global_active_power <- as.numeric(data_to_plot$Global_active_power)


########################################
# Create Plot 1 and save in png file
########################################

png("plot1.png",width = 480, height = 480)
hist(data_to_plot$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
