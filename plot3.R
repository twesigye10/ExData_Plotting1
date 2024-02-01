library(dplyr)
library(lubridate)

# read the data and create a date time column
df_hpc_extract <- read.table("extract_household_power_consumption.txt", header = TRUE) %>% 
  mutate(DateTime = paste(Date, Time),
         DateTime = as_datetime(DateTime))
  
# plot line plots for the sub metering 
plot(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_1, "n", xlab = "", ylab = "energy sub metering")
lines(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_1, type = "l", )
lines(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_2, type = "l", col="red")
lines(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_3, type = "l", col="blue")

# add the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),
       lty=1, cex = 0.5)

# copy to png
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
