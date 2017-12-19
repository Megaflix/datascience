corr <- function(directory, threshold = 0) {

# Load the dataframe from complete.R using files in folder 'directory'

	com_dat = complete(directory) # comdat = complete dataframe

# datas is a vector of integer id numbers in dataframe, bigger than threshold

	big_integers = com_dat[com_dat["nobs"] > threshold, ]$id

# print(datas)  # remove hashtag in front to see the id numbers greater than 'threshold'

	c <- c()
	output <- numeric()

for (i in big_integers) {

	content <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
	filef = content[complete.cases(content), ]
	m <- sum(complete.cases(filef) == TRUE)

if(m > threshold) {
	output = c(output, cor(filef[,2], filef[,3], use = "pairwise.complete.obs"))

}

output <- c(c,output)

}

output

} 
