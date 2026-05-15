# Hedging-Correlation-Risk-in-Financial-Markets
This repository is made as a central location where the code can be found to recreate the results for the thesis 'Hedging Correlation Risk in Financial Markets', by Bram Verjans and Ivo De Brabandere


## General Workflow
### 1. '1. Package installer / Package Installer.R'
- inputs:
- outputs:

### 2. '2 Raw option data'

### 3. '3. Data loader / Loading Data.R'

#### Purpose
Loads and combines the raw option data, zero-coupon bond data, and portfolio weights for 2008–2010. 
This file is intended to be sourced by other scripts and is not executed standalone.

#### Inputs
- `optdata_<YYYY>_<M>.csv`
- `zerocd_<YYYY>.csv`
- `weights_<YYYY>.csv`

#### Outputs
- `data`
- `zcb`
- `weights`

### 4. `4. Model-free vs realized correlation / Model-Free Implied Correlation.R`

#### Purpose

This file computes the model-free implied correlation (MFIC) as is shown in section 2.3.1 of the thesis.

#### Inputs
- The option data loaded using the `Loading Data.R`

#### Outputs
- `Model_Free_Implied_Correlation_M<Mat>.csv`
- `INTERMEZZO_heatmap_2010_12_M<Mat>.png`
with '<Mat>' depicting the maturity specified.