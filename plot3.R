# Peer Graded Assignment: Course Project 1 for Coursera
# Exploratory Data Analysis
# File name = plot3.R
# Created by Lon Lieberman
# Created using a MAC OS 10.11.6 | RStudio version 0.99.902 | R 3.3.0
###############################################################################
# Instructions:
# For each plot you should:
# 
# Construct the plot and save it to a PNG file with a width of 480 pixels and a 
# height of 480 pixels.
# 
# Name each of the plot files as plot1.png, plot2.png, etc.
# 
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs 
# the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
# Your code file should include code for reading the data so that the plot 
# can be fully reproduced. You should also include the code that creates 
# the PNG file.
# 
# Add the PNG file and R code file to your git repository
# 
# When you are finished with the assignment, push your git repository to 
# GitHub so that the GitHub version of your repository is up to date. 
# There should be four PNG files and four R code files.
# 
###############################################################################
# Working Directory
setwd("Documents/R/Assignments/Data_Cleaning_Coursera/Exploratory_Data_Analysis/")

# Note that in this dataset missing values are coded as ?.
electricPowerConsumption <- read.table("household_power_consumption.txt",
                                       header = TRUE,
                                       sep = ";",
                                       colClasses = c(rep("character",2),
                                                      rep("numeric", 7)),
                                       na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
# You may find it useful to convert the Date and Time variables to 
# Date/Time classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚒𝚖𝚎()  and 𝚊𝚜.𝙳𝚊𝚝𝚎() functions.

# Select dates
chart_electricalPowerConsumption <- subset(electricPowerConsumption,
                                           electricPowerConsumption$Date 
                                           %in% c("1/2/2007", "2/2/2007"))

chart_electricalPowerConsumption$timestamp <- strptime(
        paste(
                chart_electricalPowerConsumption$Date, 
                chart_electricalPowerConsumption$Time),
                format = "%d/%m/%Y %H:%M:%S")

# Launch png and create file
png(filename = "plot3.png",
    height = 480,
    width = 480)

# Common code ends here.
plot(chart_electricalPowerConsumption$timestamp,
     chart_electricalPowerConsumption$Sub_metering_1,
     type = "l", 
     xlab = "", 
     ylab = "Energy Sub Meeting")

# Need to add lines() for sub meetering 2 & 3
lines(chart_electricalPowerConsumption$timestamp, 
      chart_electricalPowerConsumption$Sub_metering_2,
      col = "red")

lines(chart_electricalPowerConsumption$timestamp,
      chart_electricalPowerConsumption$Sub_metering_3,
      col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       border = "black",
       lty = c(1, 1))


dev.off()
