library(dplyr)
library(lubridate)

# download data -----------------------------------------------------------

filename <- "household_power_consumption.zip"

# Checking if archive already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if file exists
if (!file.exists("household_power_consumption.txt")) { 
  unzip(zipfile = filename) 
}


# reading data ------------------------------------------------------------

df_hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") %>% 
  as_tibble() %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date %in% c(as_date("2007-02-01"), as_date("2007-02-02")))

write.table(df_hpc, "extract_household_power_consumption.txt", row.name=FALSE)
