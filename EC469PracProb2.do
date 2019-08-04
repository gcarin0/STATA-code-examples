//Giancarlo Carino
//EC469
//4.24 Class Practice Problems 2

cd "/Users/gc/Desktop/Econometrics/4.24"
import delimited "lab2_dataset", clear

//Transform nominal prices (and income) to real prices (and income)

gen RealPchuck=(pchuck)/(cpi)*211.445
gen RealPchkn=(pchkn)/(cpi)*211.445
gen RealIncome=(income)/(cpi)*211.445
gen RealPpork=(ppork)/(cpi)*211.445
gen RealPsirloin=(psirloin)/(cpi)*211.445
gen RealPporter=(pporter)/(cpi)*211.445
//Regression
reg qchuck RealPchuck RealPchkn RealIncome
//Summary statistics for real prices
sum
sum RealPchuck RealPchkn RealPporter RealIncome
//Generate total quantity variables
gen totalQchuck = sum(qchuck)
gen totalQsirloin = sum(qsirloin)
gen totalQchkn = sum(qchkn)
gen totalQpork = sum(qpork)
gen totalQporter = sum(qporter)
//Summary statistics for total quantities
sum(totalQchuck)
sum(totalQsirloin)
sum(totalQchkn)
sum(totalQpork)
sum(totalQporter)

//Create time trend
gen t=_n
tsset t

//Regression + Time trend
reg qchuck RealPchuck RealPchkn RealIncome t
