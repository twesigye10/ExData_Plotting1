library(lubridate)

# read the data and create a date time column
df_hpc_extract <- read.table("extract_household_power_consumption.txt", header = TRUE) %>% 
  mutate(DateTime = paste(Date, Time),
         DateTime = as_datetime(DateTime))
  
# plot a line plot 
plot(df_hpc_extract$DateTime, df_hpc_extract$Global_active_power, type = "l", 
     xlab = "", 
     ylab = "Global active power (Kilowatts)")

dev.copy(png, "plot2.png")
dev.off()
