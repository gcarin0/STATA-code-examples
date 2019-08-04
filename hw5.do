cd "/Users/gc/Desktop/Econometrics/"

import delimited "hw5_data", clear

ssc install margeff

logit ins retire hstatusg age hhincome educyear married
mfx

logit ins retire hstatusg age hhincome educyear married
margeff

probit ins retire hstatusg age hhincome educyear married
mfx

probit ins retire hstatusg age hhincome educyear married
margeff
