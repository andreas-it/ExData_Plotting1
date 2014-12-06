library(data.table)
dt = fread("/home/andrea/Progetti/R/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
dt = dt = dt[Date == c("1/2/2007","2/2/2007"),]
dt$DateTime = paste(dt$Date, dt$Time)

par(mfrow=c(2,2))

plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Global_active_power), type='l', xlab="", ylab="Global active power")

plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Voltage), type='l', xlab="", ylab="Voltage") 

r= range(c(as.numeric(dt$Sub_metering_1), as.numeric(dt$Sub_metering_2), as.numeric(dt$Sub_metering_3)))
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Sub_metering_1), type='l', xlab="", ylab="Energy sub metering", col='black', ylim=r)
par(new=T)
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Sub_metering_2), type='l', xlab='', ylab='', axes=F, col='red', ylim=r)
par(new=T)
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Sub_metering_3), type='l', xlab='', ylab='', axes=F, col='blue', ylim=r)
legend('topright', names(dt)[c(7,8,9)], lty=1, col=c('black', 'red', 'blue'), bty='n', cex=0.25)
par(new=F)

plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Global_reactive_power), type='l', xlab="", ylab="Global reactive power") 

dev.copy(png, file = "/home/andrea/Progetti/R/ExData_Plotting1/plot4.png")
dev.off()

