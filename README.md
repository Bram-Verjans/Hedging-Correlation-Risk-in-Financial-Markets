# Hedging-Correlation-Risk-in-Financial-Markets
This repository is made as a central location where the code can be found to recreate the results for the thesis 'Hedging Correlation Risk in Financial Markets', by Bram Verjans and Ivo De Brabandere


## General Workflow
1. '1. Package installer / Package Installer.R'
- inputs:
- outputs:

2. '2 Raw option data'

3. '3. Data loader / Loading Data.R'

#### General
- Loads and combines the raw option data, zero-coupon bond data, and portfolio weights for 2008–2010.  
  The script also converts Excel serial dates to R date format.

  This file is intended to be sourced by other scripts and is not executed standalone.

#### Inputs
- `optdata_<YYYY>_<M>.csv`
- `zerocd_<YYYY>.csv`
- `weights_<YYYY>.csv`

#### Outputs
- `data`
- `zcb`
- `weights`
