#Plot 2

##Cargando archivo

file<-read.table("D:/Mis documentos/Documents/CursoR/M4- Proyect week 1/household_power_consumption.txt", sep=";", header=TRUE)
file3<-subset(file, file$Date=="1/2/2007" | file$Date=="2/2/2007")
file3$Date<-strptime(file3$Date, '%d/%m/%Y') 

##Graficando

b=as.numeric(as.character(file3[,3]))
d=as.POSIXct(paste(file3$Date, file3$Time), format="%Y-%m-%d %H:%M:%S")

library("datasets")
plot(d,b, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex.lab=0.75, cex.axis=0.75)
dev.copy(png,file="Plot2.png")
dev.off()