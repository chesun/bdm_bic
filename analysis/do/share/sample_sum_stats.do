********************************************************************************
/* Sample summary statistics */
********************************************************************************
************************ Written by Christina Sun 11/2/2022 *******************


/* Change Log: */



 /* to run this do file:
 do ./do/share/sample_sum_stats.do
 */

cap log close _all

log using $projdir/log/sample_sum_stats.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color
set seed 1984



// load data
use $datadir/clean/bdm_full_sample_wide, clear


estpost tabstat age_p gender_w gender_m ///
  bachelor_above probability_course totalapprovals_p ///
  if treatment=="full_info", ///
  stats(mean sd) columns(statistics)

est save $projdir/est/sum_stats_full_info.ster, replace

estpost tabstat age_p gender_w gender_m ///
  bachelor_above probability_course totalapprovals_p ///
  if treatment=="no_info", ///
   stats(mean sd) columns(statistics)

est save $projdir/est/sum_stats_no_info.ster, replace


estpost tabstat age_p gender_w gender_m ///
  bachelor_above probability_course totalapprovals_p, ///
   stats(mean sd) columns(statistics)

est save $projdir/est/sum_stats_all.ster, replace


est use $projdir/est/sum_stats_full_info.ster
eststo full_info

est use $projdir/est/sum_stats_no_info.ster
eststo no_info

est use  $projdir/est/sum_stats_all.ster
eststo all

// need to use doubel quotes for overleaf directory
esttab full_info no_info all using "$overleafdir/tables/sample_sum_stats.tex" ///
  , replace nonumbers label wide ///
  cells("mean(fmt(2)) sd(fmt(2))") ///
  mtitles("Full Info" "No Info" "Overall")

// HAVE TO USE cells() !!!
esttab full_info no_info all using $projdir/out/tab/sample_sum_stats.csv ///
  , replace nonumbers label  ///
  cells("mean(fmt(2)) sd(fmt(2))") ///
  mtitles("Full Info" "No Info" "Overall")







log close
translate $projdir/log/sample_sum_stats.smcl ///
  $projdir/log/sample_sum_stats.log, replace
