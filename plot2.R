## Reading RDS
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Generating the plot
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions,
        names.arg=aggregatedTotalByYear$year,
        xlab="years",
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in Baltimore City, MD emissions between 1999 and 2008'))
dev.off()