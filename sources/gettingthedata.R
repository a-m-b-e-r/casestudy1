# First, we will put the URLs of the data into the variables gdpsite and educsite.
gdpsite<-"https://d396qusza40orc.cloudfront.net/getdata/data/GDP.csv"
educsite<-"https://d396qusza40orc.cloudfront.net/getdata/data/EDSTATS_Country.csv"

# Create a folder to put the data in:
dir.create("data")

#Next, we download the files from both URLs:
download.file(gdpsite, destfile="data/GDP data.csv")
download.file(educsite, destfile="data/education data.csv")

# To verify that the data was downloaded, we will look at the dimensions and structure of each set.
gdpraw<-read.csv("data/GDP data.csv", header=FALSE, sep=",", stringsAsFactors = FALSE)
dim(gdpraw)
str(gdpraw)

educationraw<-read.csv("data/education data.csv", header=TRUE, sep=",")
dim(educationraw)
str(educationraw)