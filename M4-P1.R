##Cargando archivo
file<-read.table("D:/Mis documentos/Documents/CursoR/M4- Proyect week 1/household_power_consumption.txt", sep=";", header=TRUE)
file3<-subset(file, file$Date=="1/2/2007" | file$Date=="2/2/2007")
file3$Date<-strptime(file3$Date, '%d/%m/%Y') 


##Graficando

##Plot1
library("datasets")

a=as.character(file3[,3])
b=as.numeric(a)

hist(b, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", cex.lab=0.75, cex.axis=0.75)
dev.copy(png,file="Plot1.png")
dev.off()

##Plot2
b=as.numeric(as.character(file3[,3]))
d=as.POSIXct(paste(file3$Date, file3$Time), format="%Y-%m-%d %H:%M:%S")

library("datasets")
plot(d,b, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex.lab=0.75, cex.axis=0.75)
dev.copy(png,file="Plot2.png")
dev.off()

##Plot3

d=as.POSIXct(paste(file3$Date, file3$Time), format="%Y-%m-%d %H:%M:%S")
s1=as.numeric(as.character(file3$Sub_metering_1))
s2=as.numeric(as.character(file3$Sub_metering_2))
s3=as.numeric(as.character(file3$Sub_metering_3))
              
              
library("datasets")
plot(d,s1, type="n", ylab="Energy sub metering", xlab="",cex.lab=0.75, cex.axis=0.75)
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),adj=0,lwd=1,cex=0.7,y.intersp=0.6)
lines(d,s1)
lines(d,s2, col="red")
lines(d,s3, col="blue")
dev.copy(png,file="Plot3.png")
dev.off()


##Plot4
library("datasets")
b=as.numeric(as.character(file3[,3]))
d=as.POSIXct(paste(file3$Date, file3$Time), format="%Y-%m-%d %H:%M:%S")
v=as.numeric(as.character(file3$Voltage))
s1=as.numeric(as.character(file3$Sub_metering_1))
s2=as.numeric(as.character(file3$Sub_metering_2))
s3=as.numeric(as.character(file3$Sub_metering_3))
r=as.numeric(as.character(file3$Global_reactive_power))

par(mfrow=c(2,2))
plot(d,b, type="l", ylab="Global Active Power", xlab="", cex.lab=0.75, cex.axis=0.75)
plot(d,v, type="l", ylab="Voltage", xlab="datetime",cex.lab=0.75, cex.axis=0.75)
plot(d,s1, type="n", ylab="Energy sub metering", xlab="", cex.label=0.3, cex.axis=0.75)
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),adj=-0.1,lwd=1,cex=0.6,y.intersp=0.6,bty="n")
lines(d,s1)
lines(d,s2, col="red")
lines(d,s3, col="blue")
plot(d,r, type="l", ylab="Global_reactive_power", xlab="datetime", cex.lab=0.75, cex.axis=0.75)
dev.copy(png,file="Plot4.png")
dev.off()