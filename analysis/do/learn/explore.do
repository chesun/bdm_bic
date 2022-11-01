********
************************************************************************
/* initial exploration of patterns and preliminary regressions */
********************************************************************************
************************ Written by Christina Sun 10/30/2022 *******************


/* Change Log: */



 /* to run this do file:
 do ./do/learn/explore.do
 */

cap log close _all

log using $projdir/log/explore.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics on
set scheme s1color
set seed 1984

local date1 = c(current_date)
local time1 = c(current_time)


// load data
use $datadir/clean/bdm_full_sample_long, clear

tempfile full_sample
save `full_sample'


//------------------------------------------------------------------------
//  magnitude of false reports
//------------------------------------------------------------------------
sum belief1_dist_abs if belief1_false==1 & full_info==1
sum belief1_dist_abs if belief1_false==1 & full_info==0

/* mean distance is around 10 percentage points, no difference between treatments */





//------------------------------------------------------------------------
//  OLS for pooled false reports
//------------------------------------------------------------------------
di "************"
di "pooled false reports on treatment, clustered standard errors at individual level"
di "************"

reg belief1_false full_info, vce(cluster id)



di "************"
di "pooled false reports with tolerance band of 5 on treatment, clustered standard errors at individual level"
di "************"

reg belief1_false_band_5 full_info, vce(cluster id)

//------------------------------------------------------------------------
//  OLS for false reports by scenario
//------------------------------------------------------------------------

// regress false report on treatment, by scenario
forvalues i = 1/9 {

  di "************"
  di "false reports on treatment in scenario `i', clustered standard errors at individual level"
  di "************"

  reg belief1_false full_info if scenario==`i', vce(cluster id)
}


// regress false report with tolerance band of 5 on treatment, by scenario
forvalues i = 1/9 {

  di "************"
  di "false reports with tolerance band of 5 on treatment in scenario `i', clustered standard errors at individual level"
  di "************"

  reg belief1_false_band_5 full_info if scenario==`i', vce(cluster id)
}

/*  there is nothing here */

// regress false report on treatment and passing all bdm understanding checks, by scenario
preserve

keep if bdm_check_pass_all==0 | bdm_check_pass_all ==.

forvalues i = 1/9 {

  di "************"
  di "false reports on treatment in scenario `i' restricted to subjects who did not pass all bdm understanding checks, clustered standard errors at individual level"
  di "************"

  reg belief1_false full_info if scenario==`i', vce(cluster id)
}

restore, preserve
keep if bdm_check_pass_all !=.

forvalues i = 1/9 {

  forvalues j = 1/4 {

      di "************"
      di "false reports by bdm check question `j' in scenario `i' in full info treatment"
      di "************"

      tab belief1_false bdm_check_`j'_pass if scenario==`i'
  }
}

/* NOTE: false reports are not driven by any particular bdm check question */

restore, preserve
collapse (mean) bdm_check*pass, by(id)


  forvalues j = 1/4 {

      di "************"
      di "tabulation of subjects passing bdm check question `j' in full info treatment"
      di "************"

      tab bdm_check_`j'_pass
  }



//relationship between bdm check questions

  di "************"
  di "tabulation of subjects passing bdm check question 1 and 2 in scenario `i' in full info treatment"
  di "************"

  tab bdm_check_1_pass bdm_check_2_pass

  di "************"
  di "tabulation of subjects passing bdm check question 3 and 4 in scenario `i' in full info treatment"
  di "************"

  tab bdm_check_3_pass bdm_check_4_pass

/* Result: almost everyone who passed check 1 passed check 2, and same for
check 3 and 4, except 1 subject in both cases */




//------------------------------------------------------------------------
// 2. Total number of false reports for each subject by scenario and treatment
//------------------------------------------------------------------------
restore, preserve

collapse (sum) n_false=belief1_false n_false_band_5=belief1_false_band_5 ///
  (mean) bdm_check*pass n_bdm_check_pass full_info ///
  (firstnm) instruction_confusion coursework ///
  , by(id)


tab n_false








local date2 = c(current_date)
local time2 = c(current_time)

di "Do file explore.do start date time: `date1' `time1'"
di "End date time: `date2' `time2'"

log close
translate $projdir/log/explore.smcl ///
  $projdir/log/explore.log, replace

view $projdir/log/explore.smcl
