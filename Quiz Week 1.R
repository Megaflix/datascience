## Load the dataset 'hw1_data.csv'
my_data <- read.csv("hw1_data.csv") ## Reads hw1_data.csv to data frame
my_data                             ## Shows contents of hw1_data.csv

## Q11 What are the column names of the dataset?
names(my_data)				## Show column names

## Q12 Extract first 2 rows, what does the output look like?
head(my_data, 2)     	            ## Data van eerste 2 rijen    

## Q13 How many observations (rows) in this data frame?
nrow(my_data)				## Show number of rows in my_data

## Q14 Extract last 2 rows, what does the output look like?
tail(my_data, 2)			      ## Data van laatste 2 rijen    
             
## Q15 What is the value of Ozone in the 47th row?
my_data$Ozone[47]				## Shows value of Ozone in row 47

## Q16 How many missing values are in the Ozone column of this data frame?
my_na <- is.na(my_data$Ozone)		## Put all Ozone NAs in my_na
sum(my_na)					## Count all NAs in my_na
sum(is.na(my_data$Ozone))		## Count all NAs in Ozone

## Q17 What is the mean of Ozone column in this dataset excluding NAs?
good <- complete.cases(my_data)	## Put all Ozone values without NA in 'good'
mean(my_data$Ozone[good])		## Shows mean of Ozone values excl NA

## Q18 What is the mean of Solar.R in subset of rows where Ozone > 31 and Temp > 90
mean(my_data$Solar.R[!is.na(my_data$Solar.R) & !is.na(my_data$Ozone) & !is.na(my_data$Temp) & my_data$Temp > 90 & my_data$Ozone > 31])  ## Mean of Solar.R when Ozone > 31 and Temp > 90
mean(my_data$Solar.R[!is.na(my_data$Solar.R & my_data$Ozone & my_data$Temp) & my_data$Temp > 90 & my_data$Ozone > 31]) ## Mean of Solar.R when Ozone > 31 and Temp > 90

## Q19 What is the mean of Temp when Month is equal to 6?
mean(my_data$Temp[my_data$Month == 6]) ## Mean Temp in Month 6