# reading file and unzipping

fl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fl, "./data/household_power_consumption.zip", method = "curl")
data = read.csv2(unz("./data/household_power_consumption.zip", "./data/household_power_consumption.txt"))

# subsetting for the analysis period and getting tidy

data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Global_active_power = as.numeric(data$Global_active_power)
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

library(lubridate)

data$Dt = paste(data$Date,data$Time)
data$Dt = dmy_hms(data$Dt)

# creating the plot

plot(data$Dt, data$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering" )
points(data$Dt, data$Sub_metering_2, type = "l", col = "red")
points(data$Dt, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

       
# generating the PNG file

dev.copy(png, "plot3.png")
dev.off()
