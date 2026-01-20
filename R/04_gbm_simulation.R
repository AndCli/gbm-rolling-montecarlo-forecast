
simulate_gbm <- function(S0, mu, sigma, n_sim = 10000, delta_t = 1) {
  epsilon <- rnorm(n_sim)
  S0 * exp((mu - 0.5 * sigma^2) * delta_t + sigma * sqrt(delta_t) * epsilon)
}
