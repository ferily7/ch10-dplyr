# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- data.frame(vehicles[vehicles$year == 1997,])

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
#unique(vehicles.1997$year == 1997)
length(unique(vehicles.1997$year)) == 1

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.drive <- data.frame(vehicles[vehicles$cty > 20 & vehicles$drive == "2-Wheel Drive",])

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.mpg <- two.wheel.drive$id[two.wheel.drive$hwy == min(two.wheel.drive$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYearFilter <- function(year, make){
  vehicles.in.year <- vehicles[vehicles$year == year & vehicles$make == make,]
  return(vehicles.in.year[vehicles.in.year$hwy == max(vehicles.in.year$hwy),])
}

# What was the most efficient honda model of 1995?
MakeYearFilter(1995, 'Honda')

