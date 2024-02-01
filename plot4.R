library(dplyr)
library(lubridate)

# read the data and create a date time column
df_hpc_extract <- read.table("extract_household_power_consumption.txt", header = TRUE) %>% 
  mutate(DateTime = paste(Date, Time),
         DateTime = as_datetime(DateTime))
  
# set the plot area
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Global active power plot
plot(df_hpc_extract$DateTime, df_hpc_extract$Global_active_power, type = "l", xlab = "", ylab = "Global active power")
# Voltage plot
plot(df_hpc_extract$DateTime, df_hpc_extract$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot line plots for the sub metering 
plot(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_1, "n", xlab = "", ylab = "energy sub metering")
lines(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_1, type = "l", )
lines(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_2, type = "l", col="red")
lines(df_hpc_extract$DateTime, df_hpc_extract$Sub_metering_3, type = "l", col="blue")
# add the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),
       lty=1, cex = 0.25)

# Global reactive power
plot(df_hpc_extract$DateTime, df_hpc_extract$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power")

# copy to png
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
