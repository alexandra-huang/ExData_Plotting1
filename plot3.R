## Creates Plot 3 as shown in the assignment and saves to plot3.png

## Reads data in from file
powerdata <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";")
## Converts dates to Date type
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

## Subsets data for the two appropriate dates
powerdatasub <- subset(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")
powerdatasub$Global_active_power <- as.numeric(as.character
                                               (powerdatasub$Global_active_power))

## Puts together date and time for x axis of plot
dateandtime <- strptime(paste(powerdatasub$Date, powerdatasub$Time, sep = " "),
                        "%Y-%m-%d %H:%M:%S")

## Converts sub_metering values to numeric values
powerdatasub$Sub_metering_1 <- as.numeric(as.character(powerdatasub$Sub_metering_1))
powerdatasub$Sub_metering_2 <- as.numeric(as.character(powerdatasub$Sub_metering_2))
powerdatasub$Sub_metering_3 <- as.numeric(as.character(powerdatasub$Sub_metering_3))


## Save plot to PNG file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## Creates the plot with date/time on x axis and sub_metering values on y axis
plot(dateandtime, powerdatasub$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(dateandtime, powerdatasub$Sub_metering_2, col = "red")
lines(dateandtime, powerdatasub$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()