## Creates Plot 2 as shown in the assignment and saves to plot2.png

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

## Save plot to PNG file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(dateandtime, powerdatasub$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()