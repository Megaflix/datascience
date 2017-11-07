complete <- function(directory, id = 1:332) {

# Put all files in a files list
	files_list <- list.files(directory, full.names=TRUE)

# Create an empty dataframe to put data in using rbinding

	dat <- data.frame()

# 'num' is a vector of id numbers, id = 1:332 is actually the same as c(1:332)
# therefore with 'num'
	num <- c()

# Selecting the complete items in the num-vector-ids, id = 1:332 is the same
# as id = c(1:332), therefore if the content of num is a c() of id numbers, 

	for (i in id) {
		dat <- read.csv(files_list[i])

# Rbinding files in ids listed in 'num'

		num <- rbind(num, sum(complete.cases(dat)==TRUE))
	}

# 'id' is never changed, so 'id' can stay the same, nobs = the number of
# complete cases per 'num'

	completedata <- data.frame(id, nobs=num)
	completedata
}