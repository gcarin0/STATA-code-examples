*Practice 6: Limited Dependent Variables

cd "/Users/gc/Desktop/Econometrics/"

import delimited "data03_limdep_ambexp", clear

*If latent ambulatory expenditures are observed
*then use OLS

reg ambexp educ age income female

*Tobit model
tobit ambexp educ age income female, ll(0)

*Marginal effects for censored sample
quietly tobit ambexp educ age income female, ll(0)
mfx compute, predict (ystar(0,.))

*Marginal effects for truncated sample
quietly tobit ambexp educ age income female, ll(0)
mfx compute, predict (e(0,.))
