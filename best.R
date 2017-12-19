best <- function(state, outcome) {

## Read data, select the columns needed and change the column names

data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
neededData <- data[, c(2, 7, 11, 17, 23)]
names(neededData) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")

## Check validity of state and outcome.

posOutcomes <- c("heart attack"=3, "heart failure"=4, "pneumonia"=5)

	if (!state %in% neededData$state) {
		stop ("invalid state")
		}
	else if (!outcome %in% names(posOutcomes)) {
		stop ("invalid outcome")
		}
	else {

## Select the correct state in neededData (this was added later)

neededData <- neededData[neededData$state == state,]

## Select the appropriate column based on the input of outcome argument and then sort
## it by 1) state, 2) outcome, 3) hospital name

outcomeDataSelected <- neededData[, c(1, 2, posOutcomes[outcome])]
orderedODS <- outcomeDataSelected[order(outcomeDataSelected[,2], outcomeDataSelected[,3], outcomeDataSelected[,1]),]

## Split in multiple data frames, one for each state
## splitbystate <- split(orderedODS, orderedODS[,2])

## Return hospital name in that state with lowest 30-day death
## rate

orderedODS[1,1]
}

}


