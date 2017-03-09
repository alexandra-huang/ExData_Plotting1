## Creates Plot 1 as shown in the assignment and saves to plot1.png

## Reads data in from file
powerdata <- read.table("household_power_consumption.txt", header = TRUE, 
                            sep = ";")
## Converts dates to Date type
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

## Subsets data for the two appropriate dates
powerdatasub <- subset(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")
powerdatasub$Global_active_power <- as.numeric(as.character
                                        (powerdatasub$Global_active_power))
## Save plot to PNG file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Sets the margins for the plot
par(mar = c(5,5,2,1))

## Creates the histogram with Global Active Power on the x axis and Frequency
## on the y axis
hist(powerdatasub$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

