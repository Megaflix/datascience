rankhospital <- function(state, outcome, num = best) {
  
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    if (num == "best") {
      hospitalrank <- 1 
      orderedODS <- outcomeDataSelected[order(outcomeDataSelected[,2], outcomeDataSelected[,3], outcomeDataSelected[,1]),]

      }
    else if (num == "worst") {
      hospitalrank <- 1
    ## Just going to order the list in decreasing order, and I remembered to put the hospital
    ## names in negative order to make them alphabetical again.
      orderedODS <- outcomeDataSelected[order(outcomeDataSelected[,2], outcomeDataSelected[,3], -xtfrm(outcomeDataSelected[,1]), decreasing = TRUE),]
      
    }
    else {
      hospitalrank <- num
      orderedODS <- outcomeDataSelected[order(outcomeDataSelected[,2], outcomeDataSelected[,3], outcomeDataSelected[,1]),]
      
    }
    
    orderedODS[hospitalrank,1]
  }
  
}


