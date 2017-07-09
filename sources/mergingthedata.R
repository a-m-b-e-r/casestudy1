# The data are merged by matching up each country code.
mergeddata<-merge(gdpdata, educdata, by="CountryCode")

# We can look at the general structure of the merged data.
dim(mergeddata)
str(mergeddata)
head(mergeddata)

# Only 189 of the country codes matched.

# We would like to see the data in order of increasing GDP.
sorteddata<-mergeddata[order(mergeddata$GDP),]
str(sorteddata)
head(sorteddata)

# We expect the US to be last and verify that it is:
tail(sorteddata)

# The 13th country in this list is St. Kitts and Nevis.
sorteddata[13,]

# We can check the average GDP  & rankings for each income group.
aggregate(ranking~Income.Group,data=sorteddata,FUN=mean)
aggregate(GDP~Income.Group,data=sorteddata,FUN=mean)
