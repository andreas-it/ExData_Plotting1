library(data.table)
dt = fread("household_power_consumption.txt", header=TRUE, sep=";")
dt = dt = dt[Date == c("1/2/2007","2/2/2007"),]
hist(as.numeric(dt$Global_active_power), main="Global active power", xlab="Global active power (kilowatts)", ylab="Frequency", col="red", breaks=12) 
dev.copy(png, file = "plot1.png")
dev.off()

