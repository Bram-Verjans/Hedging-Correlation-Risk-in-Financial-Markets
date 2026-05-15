#------------------------- General Purpose -------------------------
# This file constructs figure 3 from the thesis, using the COR3M Data in '2. Raw option input'. 

library(jsonlite)
library(ggplot2)
library(dplyr)
library(lubridate)
library(tidyquant)

#---------------------------------------------------
#Plotting COR3M (CBOE implied correlation, 3 months)
#---------------------------------------------------
#.json comes from https://www.cboe.com/us/indices/dashboard/cor3m/ by right-mouse clicking "inspect" (ask Gemini for specifics)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("../2. Raw option data/COR3M Data")


# 1. Load the data
# Note: Cboe data often nests the actual values inside a "data" or "values" key
raw_json <- fromJSON("COR3M (CBOE).json")
df <- raw_json$data
# 2. Clean it (Cboe usually provides timestamps in milliseconds)
# This part depends on the exact structure you find, but typically:
df_clean <- df %>%
  mutate(
    date  = as.Date(date),        # Converts '2006-01-03' to Date
    close = as.numeric(close),    # Converts '31.340000' to 31.34
    open  = as.numeric(open),     # Optional: if you want to plot more
    high  = as.numeric(high),
    low   = as.numeric(low)
  )

#output_name <-"C:/Users/bramv/Documents/Universiteit/2025-2026/Master thesis/Data/COR3M.csv"
#write.table(df_clean, output_name, row.names = FALSE,sep=";",dec=",")




pl_cor3m <- ggplot(df_clean, aes(x = date, y = close/100)) +
 scale_x_date(
    limits = c(as.Date("2006-01-03"), as.Date("2026-07-31")),
    breaks = seq(as.Date("2006-01-03"), as.Date("2026-03-06"), by = "60 months"),
    #Format of values on x-axis
    date_labels = "%Y",
    #Ensure the line touches the edges of the plot
    expand = c(0, 0) 
  ) +
  scale_y_continuous(
    limits = c(0, 1), 
    breaks = seq(0, 1, by = 0.2), # Adds labels at 0, 0.2, 0.4, etc.
    expand = c(0, 0)              # Removes the padding at the top/bottom
  ) +  
  labs(
    x = NULL,
    y = "COR3M Index",
    color = "Legend Title",
    linetype = "Legend Title"  )+
  # 50-day Simple Moving Average
  geom_ma(ma_fun = SMA, n = 50, color = "#1FABD5", linetype = 1, linewidth = 0.5) +
  
  theme_minimal()+ # Apply the base theme first
  theme(
    panel.grid = element_blank(),
    axis.line = element_line(color = "black", linewidth = 0.7),
    axis.text = element_text(color = "black"),
    axis.ticks = element_line(color = "black"),
  )
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("Figures")
ggsave('COR3M.png', 
       plot=pl_cor3m,
       width = 6.5,
       height = 3.25,
       units = "in",   # Always specify inches
       dpi = 300       # High resolution for printing
       )
