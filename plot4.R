plot4 <- function(){
    ## Read in raw data from text file
    raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?")
    
    # Convert separate date and time columns to single datetime vector
    dt <- strptime(paste(raw[,1], raw[,2]), "%d/%m/%Y %H:%M:%S")
    
    # Create logical vector of dates we are interested in
    sub <- dt >= strptime("2007-02-01","%Y-%m-%d") & dt < strptime("2007-02-03","%Y-%m-%d")
    
    # Create subset of data
    sub_raw <- raw[sub,]
    sub_dt <- dt[sub]
    
    # Create plot
    png(file="plot4.png")
    par(mfcol = c(2,2))
    plot(sub_dt, sub_raw$Global_active_power, xlab="", 
         ylab="Global Active Power (kilowatts)", type="l")
    plot(sub_dt,sub_raw$Sub_metering_1, type="l", ylab="Energy sub metering", 
         xlab="")
    lines(sub_dt, sub_raw$Sub_metering_2, col="red")
    lines(sub_dt, sub_raw$Sub_metering_3, col="blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col=c("black","red","blue"), lwd=1)
    plot(sub_dt, sub_raw$Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(sub_dt, sub_raw$Global_reactive_power, type="l",
         ylab="Global_reactive_power", xlab="datetime")
    dev.off()
}