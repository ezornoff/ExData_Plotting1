# reading file and unzipping

fl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fl, "./data/household_power_consumption.zip", method = "curl")
data = read.csv2(unz("./data/household_power_consumption.zip", "./data/household_power_consumption.txt"))

# subsetting for the analysis period and getting tidy

data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Global_active_power = as.numeric(data$Global_active_power)

# creating the plot

hist(data$Global_active_power, col = "red", main = "Global Active Power")

# generating the PNG file

dev.copy(png, "plot1.png")
dev.off()
