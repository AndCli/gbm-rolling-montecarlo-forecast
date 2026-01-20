
# Rolling GBM Monte Carlo Forecast

This project implements a rolling-window Monte Carlo forecasting framework
based on Geometric Brownian Motion (GBM) to predict next-day stock prices.

The model is estimated using historical log-returns and evaluated through
out-of-sample confidence interval coverage.

## Project structure

- `R/`  
  Modular R scripts for data loading, return computation, parameter estimation,
  simulation, and evaluation.

- `data/`  
  Input dataset containing historical stock prices used for model estimation
  and forecasting.

- `run_analysis.R`  
  Main execution script. Runs the full pipeline end-to-end.

- `output/`  
  Automatically generated outputs (e.g. coverage summary).

## Methodology

- Rolling window estimation of GBM parameters (drift and volatility)
- Monte Carlo simulation of next-day prices
- Construction of 95% confidence intervals
- Evaluation via empirical coverage rate

## Data

The repository includes a historical stock price dataset stored in the `data/`
folder. The analysis assumes daily prices and computes log-returns internally.

The dataset is used exclusively for educational and research purposes.

## How to run

1. Open the project in RStudio
2. Ensure the working directory is set to the project root
3. Run:

```r
source("run_analysis.R")
