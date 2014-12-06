library(data.table)
dt = fread("household_power_consumption.txt", header=TRUE, sep=";")
dt = dt = dt[Date == c("1/2/2007","2/2/2007"),]
dt$DateTime = paste(dt$Date, dt$Time)

r= range(c(as.numeric(dt$Sub_metering_1), as.numeric(dt$Sub_metering_2), as.numeric(dt$Sub_metering_3)))
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Sub_metering_1), type='l', xlab="", ylab="Energy sub metering", col='black', ylim=r)
par(new=T)
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Sub_metering_2), type='l', xlab='', ylab='', axes=F, col='red', ylim=r)
par(new=T)
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Sub_metering_3), type='l', xlab='', ylab='', axes=F, col='blue', ylim=r)
legend('topright', names(dt)[c(7,8,9)], lty=1, col=c('black', 'red', 'blue'), cex=0.75)

dev.copy(png, file = "plot3.png")
dev.off()

