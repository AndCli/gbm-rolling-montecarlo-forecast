

library(tidyverse)

source("R/01_load_data.R")
source("R/02_compute_returns.R")
source("R/03_rolling_estimation.R")
source("R/04_gbm_simulation.R")
source("R/05_evaluation.R")

set.seed(123)

# Parameters
window_size <- 100
n_sim <- 10000
delta_t <- 1

# Load data (you will place your file in data/)
price_df <- load_price_data("data/apple_prices.xlsx")
price_df <- compute_log_returns(price_df)

results <- tibble(
  Day = integer(),
  Predicted = numeric(),
  CI_Lower = numeric(),
  CI_Upper = numeric(),
  Actual = numeric()
)

for (i in (window_size + 1):(nrow(price_df) - 1)) {
  
  window_returns <- price_df$log_return[(i - window_size):(i - 1)]
  S0 <- price_df$Price[i]
  
  if (any(is.na(window_returns)) || is.na(S0)) next
  
  params <- estimate_gbm_parameters(window_returns, delta_t)
  sim_prices <- simulate_gbm(S0, params$mu, params$sigma, n_sim, delta_t)
  
  results <- results %>%
    add_row(
      Day = i,
      Predicted = mean(sim_prices),
      CI_Lower = quantile(sim_prices, 0.025),
      CI_Upper = quantile(sim_prices, 0.975),
      Actual = price_df$Price[i + 1]
    )
}

results <- results %>%
  mutate(Date = price_df$Date[Day + 1])

coverage <- compute_coverage_rate(results$Actual, results$CI_Lower, results$CI_Upper)

dir.create("output", showWarnings = FALSE)
writeLines(
  paste("Coverage rate:", round(coverage * 100, 2), "%"),
  "output/coverage_summary.txt"
)

print(paste("Coverage rate:", round(coverage * 100, 2), "%"))

