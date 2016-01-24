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
png(file="plot2.png",width=480,height=480, units = "px", bg = "transparent")
plot(mytime, dt$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     type = "l", xlab = "", cex.axis = 1, cex.lab = 1)
dev.off()
