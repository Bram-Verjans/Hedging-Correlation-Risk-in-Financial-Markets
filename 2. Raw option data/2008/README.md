# Inputs folder

Insert in this folder the Dow Jones option data from 2008.

The folder should contain 14 files.

## Files containing option data per month
It is important to have 1 file per month named "optdata_<YYYY>_<M>.csv".
The csv should be comma separated and uses "." as decimal separator.


| security_ID | quote_date | strike_price | expiration | best_bid | best_offer | volume | open_interest | implied_volatility | delta | close_price |
|---|---|---|---|
| `Date as an Excel serial date number  | an identifier for each security | Daily weights for each security | The price of each asset at the end of the day | best_bid | best_offer | volume | open_interest | implied_volatility | delta | close_price |
|---|---|---|---|

## File containing the weights

It is important that the weights file bears the name "weights_<YYYY>.csv" and contains all the weights for years 2008 - 2010 for the Dow Jones.
The csv should be comma separated and uses "." as decimal separator.

| quote_date | security_ID | weights | close_price |
|---|---|---|---|
| `Date as an Excel serial date number  | an identifier for each security | Daily weights for each security | The price of each asset at the end of the day |
|---|---|---|---|

## File containing the weights

It is important that the weights file bears the name "zero_cd<YYYY>.csv" and contains returns on a zero coupon bond over different maturities for the year 2008.
The csv should be comma separated and uses "." as decimal separator.

| quote_date | days | rate |
|---|---|---|
| `Date as an Excel serial date number  | maturity in days | Return on ZC bond |
|---|---|---|
