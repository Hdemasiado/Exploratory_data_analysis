# create -if it does not exist- the plots folder
if (!file.exists('plots')) {
    dir.create('plots')
}

# via script "read.clean.data.for.plots.R", get-clean-select data
source('read.clean.data.for.plots.R')

# open device
png(filename='plots/plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(selected.household.power.consumption$DateTime,selected.household.power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(selected.household.power.consumption$DateTime,selected.household.power.consumption$SubMetering2,col=lncol[2])
lines(selected.household.power.consumption$DateTime,selected.household.power.consumption$SubMetering3,col=lncol[3])

# write topright legend
legend('topright',legend=lbls,col=lncol,lty='solid')

# close device
x<-dev.off()
