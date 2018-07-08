library(stringr)

goals <- read.csv(file = "original_goals.csv", header = TRUE)




# Remove non-numeric characters ------------------------------------------------------

temp.times <- str_extract_all(goals$times, "[0-9]+")



# Determine "half" and combine times for stoppage time goals --------------------------

real.time <- NULL
which.half <- NULL
total.times <- dim(goals)[1]

for(i in 1:total.times){
  real.time[i] <- sum(as.numeric(temp.times[[i]]))
  if(as.numeric(temp.times[[i]][1]) < 46){
    which.half[i] <- 'First'
  } else if(as.numeric(temp.times[[i]][1]) <= 90 & as.numeric(temp.times[[i]][1]) > 45 & length(temp.times[[i]] == 1)){
    which.half[i] <- 'Second'
  } else{
    which.half[i] <- 'Extra'
  }
}


new.goals <- data.frame(time = real.time, half = which.half, year = goals$which.cup)

write.csv(new.goals, file="updated_goals.csv", row.names = FALSE)
