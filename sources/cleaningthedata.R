# The raw GDP data does not have descriptive variable names, so we rename them.
names(gdpraw)<-c("CountryCode", "ranking", "NA", "Country Name", "GDP")

# Only the columns with information are needed, so we create a subset with only those columns.
gdpdata<-subset(gdpraw, select=c("CountryCode", "ranking", "Country Name", "GDP"))

# The variables 'GDP' and 'ranking' are saved as strings and need to be changed into numeric values.
gdpdata$GDP<-as.numeric(gsub(",","",gdpdata$GDP))
gdpdata$ranking<-as.numeric(gdpraw$ranking) 

# We are looking at the rankings of each country's GDP. Here we will see how many observations in the GDP data do not have a ranking.
sum(is.na(gdpdata$ranking))

# There are 141 observations without rankings. We only need the ranked information so we can subset our data to exclude non-ranked observations.
gdpdata<-subset(gdpdata,!is.na(gdpdata$ranking))

# We know that there are 190 ranked countries and can verify that by checking the dimensions of the newly subsetted data:
dim(gdpdata) 

# We subset to keep only the data we're interested in: Country and Income Group.
educdata<-subset(educationraw, select=c("CountryCode", "Long.Name", "Income.Group"))

# Verify that we have the information we expect to have by looking at the structure of our subsetted data.
str(educdata)