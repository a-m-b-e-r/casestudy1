# We'll create a copy of our data to use for plotting.
plotdata <- sorteddata

# This produces a bar plot of the data.
ggplot(plotdata, aes(plotdata$CountryCode, plotdata$GDP)) + geom_col(aes(fill = Income.Group)) + theme(axis.text.x = element_blank()) + labs(x = "Country Code", y = "GDP", title = "Country Code vs. GDP") + theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank())

# We divide the data into 5 quantiles. 
plotdata$quantile<-quantcut(plotdata$ranking,5,labels=c("81-100%","61-80%","41-60%","21-40%","0-20%"))

# Make sure quantile column was succesfully added
head(plotdata)

# This chart will allow us to see the number of countries from each quantile and income group.
xtabs(~Income.Group + quantile,plotdata)