## Plot 1

##Cargando archivo

file<-read.table("D:/Mis documentos/Documents/CursoR/M4- Proyect week 1/household_power_consumption.txt", sep=";", header=TRUE)
file3<-subset(file, file$Date=="1/2/2007" | file$Date=="2/2/2007")
file3$Date<-strptime(file3$Date, '%d/%m/%Y') 

##Graficando

library("datasets")

a=as.character(file3[,3])
b=as.numeric(a)

hist(b, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", cex.lab=0.75, cex.axis=0.75)
dev.copy(png,file="Plot1.png")
dev.off()
