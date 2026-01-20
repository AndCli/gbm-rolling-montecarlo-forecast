
estimate_gbm_parameters <- function(returns, delta_t = 1) {
  r_bar <- mean(returns, na.rm = TRUE)
  sigma_hat <- sd(returns, na.rm = TRUE)
  mu_hat <- (r_bar / delta_t) + 0.5 * sigma_hat^2
  
  list(mu = mu_hat, sigma = sigma_hat)
}
