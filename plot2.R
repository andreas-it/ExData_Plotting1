library(data.table)
dt = fread("/home/andrea/Progetti/R/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
dt = dt = dt[Date == c("1/2/2007","2/2/2007"),]
dt$DateTime = paste(dt$Date, dt$Time)
plot(strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S"), as.numeric(dt$Global_active_power), type='l', xlab="", ylab="Global active power (kilowatts)")
dev.copy(png, file = "/home/andrea/Progetti/R/ExData_Plotting1/plot2.png")
dev.off()

