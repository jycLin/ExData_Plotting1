file <- "household_power_consumption.txt"
system.time(mydata <- read.table(file, header = TRUE, sep = ";",
                     stringsAsFactors = FALSE, 
                     na.strings = c("?","NA","NULL")))
system.time(usedata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007"))
png(file="plot1.png",width=480,height=480, units = "px", bg = "transparent")
hist(usedata$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     bg = "transparent")
dev.off()
