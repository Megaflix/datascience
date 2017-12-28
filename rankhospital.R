rankhospital <- function(state, outcome, num = best) {
  
  ## Read data, select the columns needed and change the column names
  
  data <- read.csv("outcome-of-care-measures.csv", 
                   na.strings = "Not Available", 
                   stringsAsFactors = FALSE)
  neededData <- data[, c("Hospital.Name", 
                         "State",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
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
    
    outcomeDataSelected <- neededData[, c("hospital", "state", 
                                          names(posOutcomes[outcome]))]
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    orderedODS <- outcomeDataSelected[order(outcomeDataSelected[,"state"],
                          outcomeDataSelected[,names(posOutcomes[outcome])], 
                          outcomeDataSelected[,"hospital"]),]    
    if (num == "best") {
      hospitalrank <- 1 
      }
    else if (num == "worst") {
      hospitalrank <- nrow(orderedODS)
    }
    else {
      hospitalrank <- num
    }
    
    orderedODS[hospitalrank,"hospital"]
  }
  
}
