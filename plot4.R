# create -if it does not exist- the plots folder
if (!file.exists('plots')) {
    dir.create('plots')
}

# via script "read.clean.data.for.plots.R", get-clean-select data
source('read.clean.data.for.plots.R')

# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(selected.household.power.consumption$DateTime,selected.household.power.consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(selected.household.power.consumption$DateTime,selected.household.power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(selected.household.power.consumption$DateTime,selected.household.power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(selected.household.power.consumption$DateTime,selected.household.power.consumption$SubMetering2,col=lncol[2])
lines(selected.household.power.consumption$DateTime,selected.household.power.consumption$SubMetering3,col=lncol[3])

# plot data on bottom right (2,2)
plot(selected.household.power.consumption$DateTime,selected.household.power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
x<-dev.off()
