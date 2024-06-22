## Title ----
# Create a listsum function which checks whether different combinations of values
# within a vector can sum to a given number                         

## Current issues ----
# 2024/06/22: Can't handle duplicates in the vector

## Set working directory ----
setwd("~")

## Install necessary packages ----
install.packages("gtools") # combinations() function

## Load libraries ----
library(gtools) # combinations() returns unique combinations in a vector
library(rlang) # is_empty() handles empty dataframes AND vectors

## Create a function which returns all combinations of numbers in a vector which
## sum to a desired value. Ideally it can handle 2:length(vector) combinations
sum_to_value <- function(numbers, target_value){
  
  for (i in 2:length(numbers)) {
    
    calc_combinations <- combinations(v = numbers, n = length(numbers), r = i)
    calc_combinations <- calc_combinations[rowSums(calc_combinations) == target_value, ]
    
    if (!is_empty(calc_combinations)) {
      
      message(paste0("combinations of ", i, " numbers"))
      print(calc_combinations)
      
    } else {
      
      message(paste0("no combinations of ", i,  " numbers"))
      
    }
    
  }
  
}

## Test function ----
sum_to_value(numbers = c(1,2,3,5,6,7,9), target_value = 15)
