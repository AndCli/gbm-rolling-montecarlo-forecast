
library(tidyverse)
library(readxl)
library(lubridate)

load_price_data <- function(path) {
  price_df <- read_excel(path) %>%
    mutate(
      Price = as.numeric(gsub(",", "", Price)),
      Date = as.Date(Date)
    ) %>%
    arrange(Date)
  
  return(price_df)
}
