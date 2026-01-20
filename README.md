# Rolling GBM Monte Carlo Forecast

This project implements a rolling-window Monte Carlo forecasting framework
based on Geometric Brownian Motion (GBM) to predict next-day stock prices.

The model is estimated using historical log-returns and evaluated through
out-of-sample confidence interval coverage.

## Project structure

- `R/`  
  Modular R scripts for data loading, return computation, parameter estimation,
  simulation, and evaluation.

- `run_analysis.R`  
  Main execution script. Runs the full pipeline end-to-end.

- `output/`  
  Automatically generated outputs (e.g. coverage summary).

## Methodology

- Rolling window estimation of GBM parameters
- Monte Carlo simulation of future prices
- Construction of 95% confidence intervals
- Evaluation via empirical coverage rate

## How to run

1. Place the price data in the `data/` folder
2. Open the project in RStudio
3. Run:

```r
source("run_analysis.R")

