library(data.table)
file <- "household_power_consumption.txt"
system.time(mydata <- read.table(file, header = TRUE, sep = ";",
                                 stringsAsFactors = FALSE, 
                                 na.strings = c("?","NA","NULL")))
system.time(usedata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007"))
dt <- data.table(usedata)
rm("usedata")
#Sys.getlocale()
Sys.setlocale("LC_TIME", "English")
mytime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S",
                   tz = "America/New_York")
png(file="plot3.png",width=480,height=480, units = "px", bg = "transparent")
plot(mytime, dt$Sub_metering_1, ylab = "Energy sub metering",
     type = "l", xlab = "", cex.axis = 1, cex.lab = 1)
lines(mytime, dt$Sub_metering_2, col = "red")
lines(mytime, dt$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 1, x.intersp = 2.5, adj = 0.2)
dev.off()
