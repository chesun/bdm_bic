********************************************************************************
/*regression tables  */
********************************************************************************
************************ Written by Christina Sun 10/30/2022 *******************


/* Change Log: */



 /* to run this do file:
 do ./do/share/reg_tables.do
 */

cap log close _all

log using $projdir/log/reg_tables.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color
set seed 1984

local date1 = c(current_date)
local time1 = c(current_time)


// load data
use $datadir/clean/bdm_full_sample_long, clear

tempfile full_sample
save `full_sample'



//------------------------------------------------------------------------
//  OLS for pooled false reports
//------------------------------------------------------------------------

reg belief1_false full_info, vce(cluster id)

esttab using "$projdir/out/tab/false_by_treat_ols.tex", se replace nonumbers ///
  mtitles("False Report for Prior")

esttab using "$overleafdir/tables/false_by_treat_ols.tex", se replace nonumbers ///
  mtitles("False Report for Prior")


reg belief1_false full_info gender_w bachelor_above probability_course, vce(cluster id)



//------------------------------------------------------------------------
// probit for pooled false reports
//------------------------------------------------------------------------

probit belief1_false full_info, cluster(id)
margins, dydx(*)
// it gives the same marginal effects



//------------------------------------------------------------------------
// OLS for confusion
//------------------------------------------------------------------------

reg belief1_false i.confused gender_w bachelor_above probability_course, vce(cluster id)

esttab using "$overleafdir/tables/false_by_confused_ols.tex", se replace nonumbers ///
  label noomitted noconstant drop(0.confused _cons) mtitles("False Report for Prior") ///
  addnotes("OLS model, SE clustered at individual level")


//------------------------------------------------------------------------
// probit for confusion
//------------------------------------------------------------------------

probit belief1_false i.confused gender_w bachelor_above probability_course, cluster(id)

esttab using "$overleafdir/tables/false_by_confused_probit.tex", ///
  star(* 0.10 ** 0.05 *** 0.01) se replace nonumbers ///
  label noomitted noconstant drop(0.confused _cons) mtitles("False Report for Prior") ///
  addnotes("Probit model, SE clustered at individual level") ///














log close
translate $projdir/log/reg_tables.smcl ///
  $projdir/log/reg_tables.log, replace
