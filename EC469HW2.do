//Giancarlo Carino
//EC 469
//HW2
cd "/Users/gc/Desktop/Econometrics/05.15"
import delimited "homework2_dataset", clear

sort year

*create variables for real prices, base year 1990
gen realappr = (appr)/(cpi)*130.66
gen realbapr = (bapr)/(cpi)*130.66
gen realgrpr = (grpr)/(cpi)*130.66
gen realgfpr = (gfpr)/(cpi)*130.66
gen realorpr = (orpr)/(cpi)*130.66
gen realdisi = (disi)/(cpi)*130.66

*create time variable and set as time series
gen t = _n
tsset t

*create natural log of real prices variable
gen lnapp = ln(apples)
gen lnrlappr = ln(realappr)
gen lnrlbapr = ln(realbapr)
gen lnrlgfpr = ln(realgfpr)
gen lnrlgrpr = ln(realgrpr)
gen lnrlorpr = ln(realorpr)
gen lnrldisi = ln(realdisi)

*Log-Lin regression model
reg lnapp realappr realbapr realgfpr realgrpr realorpr realdisi t
estat durbinalt, lags(1)

*Log-Log regression model
reg lnapp lnrlappr lnrlbapr lnrlgfpr lnrlgrpr lnrlorpr lnrldisi t

*predictions from regression model vs residuals
predict ehat, resid
regress ehat l.ehat

*Check serial correlation by plotting residual on lagged residual. Should not see any pattern
gen ehatlag=l.ehat
scatter ehat ehatlag

