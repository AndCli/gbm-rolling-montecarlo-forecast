

compute_coverage_rate <- function(actual, lower, upper) {
  mean(actual >= lower & actual <= upper, na.rm = TRUE)
}
