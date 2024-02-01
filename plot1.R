df_hpc_extract <- read.table("extract_household_power_consumption.txt", header = TRUE)


hist(df_hpc_extract$Global_active_power, 
     main = "Global active power", 
     xlab = "Global active power (Kilowatts)", 
     col = "red")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
