

compute_log_returns <- function(price_df) {
  price_df %>%
    mutate(log_return = log(Price / lag(Price)))
}
