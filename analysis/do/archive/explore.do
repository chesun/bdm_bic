********************************************************************************
/* initial exploration of patterns in the data */
********************************************************************************
************************ Written by Christina Sun 10/29/2022 *******************

/* NOTE: deprecated. Variable names have since changed and variables in this file
are no longer named as such */

/* Change Log: */



 /* to run this do file:
 do ./do/clean/explore.do
 */

log close _all

log using $repodir/log/explore.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color
set seed 1984

local date1 = c(current_date)
local time1 = c(current_time)



use $datadir/clean/bdm_full_sample_wide.dta, clear

tempfile full_sample
save `full_sample'


forvalues i = 1/9 {
  di "misreports by treatment in scenario `i'"
  bysort treatment: sum sce_`i'_misrpt

  di "t-test of percentage misreports in scenario `i' by treatment"
  ttest sce_`i'_misrpt, by(treatment)

  di "misreport classified with a tolerance band of 2"
  bysort treatment: sum sce_`i'_misrpt_band_2

  di "misreport classified with a tolerance band of 5"
  bysort treatment: sum sce_`i'_misrpt_band_5
}

di "Total misreports by treatment"
by treatment: sum n_misrpt_total

di "total misreports by treatment and objective prior"
by treatment: sum n_misrpt_lower50 n_misrpt_50 n_misrpt_higher50


di "t-test of total misreports by treatment"
ttest n_misrpt_total, by(treatment)

di "t-test of misreports when objective prior < 50% by treatment"
ttest n_misrpt_lower50, by(treatment)

di "t-test of misreports when objective prior = 50% by treatment"
ttest n_misrpt_50, by(treatment)

di "t-test of misreports when objective prior > 50% by treatment"
ttest n_misrpt_higher50, by(treatment)



tab n_udst_chck_pass if treatment=="full_info"

keep if treatment == "no_info" | udst_chck_all_pass == 1

di "t-test of total misreports by treatment, including only subjects in treatment who answered all understanding questions correctly"
ttest n_misrpt_total, by(treatment)

use `full_sample', clear

keep if treatment == "no_info" | udst_chck_all_pass == 0

di "t-test of total misreports by treatment, including only subjects in treatment who answered one or more understanding questions incorrectly"
ttest n_misrpt_total, by(treatment)

di "t-test of misreports when objective prior < 50% by treatment"
ttest n_misrpt_lower50, by(treatment)

di "t-test of misreports when objective prior = 50% by treatment"
ttest n_misrpt_50, by(treatment)

di "t-test of misreports when objective prior > 50% by treatment"
ttest n_misrpt_higher50, by(treatment)

forvalues i = 1/9 {
  di "misreports by treatment in scenario `i'"
  bysort treatment: sum sce_`i'_misrpt

  di "t-test of percentage misreports in scenario `i' by treatment"
  ttest sce_`i'_misrpt, by(treatment)

  di "misreport direction in scenario `i'"
  di "objective prior: `sce_`i'_guess_prob'%"
  by treatment: sum sce_`i'_misrpt_up
  by treatment: sum sce_`i'_misrpt_down


}
























local date2 = c(current_date)
local time2 = c(current_time)

di "Do file clean_qualtrics_data.do start date time: `date1' `time1'"
di "End date time: `date2' `time2'"

log close
translate $repodir/log/explore.smcl ///
  $repodir/log/explore.log, replace

view $repodir/log/explore.smcl
