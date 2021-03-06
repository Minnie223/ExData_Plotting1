
##Read and clean data
etable<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
etable<-cbind(etable,DT=paste(etable$Date,etable$Time));##Merge Date and Time
etable$DT<-strptime(etable$DT,"%d/%m/%Y %H:%M:%S"); ## change to date format
etable2<-etable[(etable$Date=="1/2/2007"|etable$Date=="2/2/2007"),] 
etable2$Global_active_power<-as.numeric(etable2$Global_active_power)

##Plot2
par(mfrow=c(1,1))
plot(etable2$DT,etable2$Global_active_power,type="l",xlab="",ylab="Global Active Power(killowatts)")
dev.copy(png,file="plot2.png")
dev.off()