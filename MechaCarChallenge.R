library(tidyverse)


### Perform Multiple Regression on MechaCar dataset

# Read in the csv file.
mechacar_data <- read.csv("MechaCar_mpg.csv",stringsAsFactors = F,check.names = F)

# Perform a linear regression module 
mechacar_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_data)

# Determine the p-value and r-squared of the linear regression module.
summary(mechacar_lm)



### Perform Summary Analysis on suspension coil dataset

# Read in the csv file
suspension_coil_data <- read.csv("Suspension_Coil.csv",stringsAsFactors = F, check.names = F)

# Create the Total Summary
total_summary <- suspension_coil_data %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))


# Create the Summary By Lot
lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')


### Suspension Coil T-Tests

# Peform t-test across all Lots
t.test(suspension_coil_data$PSI,mu = 1500)

# Peform t-test on Lot 1
t.test(subset(suspension_coil_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# Peform t-test on Lot 2
t.test(subset(suspension_coil_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# Peform t-test on Lot 3
t.test(subset(suspension_coil_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)

*/