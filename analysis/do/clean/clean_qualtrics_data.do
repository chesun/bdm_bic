********************************************************************************
/* clean data downloaded from Qualtrics */
********************************************************************************
************************ Written by Christina Sun 10/29/2022 *******************

/* Change Log:
*/



 /* to run this do file:
 do ./do/clean/clean_qualtrics_data.do
 */

cap log close _all

log using $projdir/log/clean_qualtrics_data.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color
set seed 1984

local date1 = c(current_date)
local time1 = c(current_time)

// import data that has been preliminarily cleaned in csv
import delimited using $datadir/raw/bdm_10_26_2022_for_import.csv, clear varnames(1)

// drop observations missing prolific ID, are incomplete, or from survey preview
drop if prolific_pid == ""
drop if status == "Survey Preview"
drop if response_type != "complete"

// subject ID
gen id = _n
label var id "Subject ID"

// delete prolific ID
drop prolific_pid

// drop variables that have no observations
drop recipientlastname recipientfirstname recipientemail externalreference ///
  sce_10* sce_11* *rand_num* *guess_3 *q_3_bonus *q_3_pay_method


//recode the start and end date into Stata date time numeric format
gen recordeddate_temp = date(startdate, "MDYhm")
format recordeddate_temp %tdnn/dd/CCYY
drop recordeddate
rename recordeddate_temp recordeddate
label var recordeddate "Survey recorded date"

rename durationinseconds duration_sec


// incentive reading time
rename q25_pagesubmit incentive_time
label var incentive_time "Read time for incentives"

// timing for reporting guesses, in seconds
rename q43_pagesubmit belief1_time_sce1
rename q49_pagesubmit belief2_time_sce1

rename q55_pagesubmit belief1_time_sce2
rename q61_pagesubmit belief2_time_sce2

rename q67_pagesubmit belief1_time_sce3
rename q73_pagesubmit belief2_time_sce3

rename q79_pagesubmit belief1_time_sce4
rename q85_pagesubmit belief2_time_sce4

rename q93_pagesubmit belief1_time_sce5
rename q99_pagesubmit belief2_time_sce5

rename q105_pagesubmit belief1_time_sce6
rename q111_pagesubmit belief2_time_sce6

rename q117_pagesubmit belief1_time_sce7
rename q123_pagesubmit belief2_time_sce7

rename q129_pagesubmit belief1_time_sce8
rename q135_pagesubmit belief2_time_sce8

rename q144_pagesubmit belief1_time_sce9
rename q150_pagesubmit belief2_time_sce9

rename q163 guess_process
rename q164 feedback
rename q165 age
rename q166 education
rename q167 gender
replace gender = q167_4_text if gender == "Other (please specify)"
rename q168 race
replace race = q168_6_text if race == "Other"
rename q169 coursework
rename q170 instruction_confusion




// rename variables for reshape
forvalues i = 1/9 {
  // prior
  rename sce_`i'_guess_1 belief1_sce`i'
  // update
  rename sce_`i'_guess_2 belief2_sce`i'

  // number of red urns
  rename sce_`i'_n_red_urn n_red_urn_sce`i'
  // number of red balls in red urn
  rename sce_`i'_n_red_ball_red_urn n_red_ball_rurn_sce`i'
  // color of selected urn
  rename sce_`i'_urn_color urn_sce`i'
  // color of the first ball ball
  rename sce_`i'_ball_1_color ball1_sce`i'

}


// dummies for answering the incentive understanding questions at the end of survey correctly
gen bdm_check_1_pass = .
replace bdm_check_1_pass = 1 if q157 == "Number Lottery"
replace bdm_check_1_pass = 0 if q157 != "Number Lottery" & q157 != ""

gen bdm_check_2_pass = .
replace bdm_check_2_pass = 1 if q158 == "I win the bonus with 20% chance"
replace bdm_check_2_pass = 0 if q158 != "I win the bonus with 20% chance" & q158 != ""

gen bdm_check_3_pass = .
replace bdm_check_3_pass = 1 if q160 == "Event Lottery"
replace bdm_check_3_pass = 0 if q160 != "Event Lottery" & q160 != ""

gen bdm_check_4_pass = .
replace bdm_check_4_pass = 1 if q161 == "I win the bonus if the selected urn is red"
replace bdm_check_4_pass = 0 if q161 != "I win the bonus if the selected urn is red" & q161 != ""

// number of correct answers for the incentive understanding checks
gen n_bdm_check_pass = bdm_check_1_pass ///
  + bdm_check_2_pass ///
  + bdm_check_3_pass ///
  + bdm_check_4_pass

// answered all incentive understanding check questions at the end of survey correctly
gen bdm_check_pass_all = .
replace bdm_check_pass_all = 1 if n_bdm_check_pass == 4
replace bdm_check_pass_all = 0 if n_bdm_check_pass < 4 & n_bdm_check_pass != .


rename q157 bdm_check_1
rename q158 bdm_check_2
rename q160 bdm_check_3
rename q161 bdm_check_4



// dummmy for full info treatment
gen full_info = 0
replace full_info = 1 if treatment == "full_info"

forvalues i = 1/9 {
  // objective prior in percentage points
  gen prior_sce`i' = n_red_urn_sce`i' * 10

  // distance to true prior
  gen belief1_dist_sce`i' = belief1_sce`i' - prior_sce`i'
  label var belief1_dist_sce`i' "Distance to objective prior in scenario `i'"

  // misreporting in scenario i first question guess
  gen belief1_false_sce`i' = 0
  replace belief1_false_sce`i' = 1 if belief1_sce`i' != prior_sce`i'


  // tolerance band 5, inclusive
  gen belief1_false_band_5_sce`i' = 0
  replace belief1_false_band_5_sce`i' = 1 if abs(belief1_sce`i' - prior_sce`i') > 5

  // direction of misreporting
  gen belief1_up_sce`i' = 0
  replace belief1_up_sce`i' = 1 if belief1_sce`i' > prior_sce`i'

  gen belief1_down_sce`i' = 0
  replace belief1_down_sce`i' = 1 if belief1_sce`i' < prior_sce`i'

}


// total number of misreports
gen n_false_total = 0
// misreports in scenarios where prior is less than 50%
gen n_false_lower50 = 0
// misreports in scenarios where prior is greater than 50%
gen n_false_higher50 = 0
// misreports in scenarios where prior is equal to 50%
gen n_false_50 = 0

gen n_false_up = 0
gen n_false_down = 0





forvalues i = 1/9 {
  replace n_false_total = n_false_total + belief1_false_sce`i'
  replace n_false_lower50 = n_false_lower50 + belief1_false_sce`i' if prior_sce`i' < 50
  replace n_false_higher50 = n_false_higher50 + belief1_false_sce`i' if prior_sce`i' > 50
  replace n_false_50 = n_false_50 + belief1_false_sce`i' if prior_sce`i' == 50

}


save $datadir/clean/bdm_full_sample_wide.dta, replace

keep duration_sec belief* ///
  guess_process feedback age education gender race coursework instruction_confusion ///
  total_bonus total_payment ///
  n_red* urn* ball* treatment request_info id recordeddate ///
  bdm_check* n_bdm* full_info prior* n_false*

order id treatment prior* belief?_sce? belief*false_sce* n_false*

// reshape into long format
reshape long prior_sce belief1_sce belief2_sce belief1_false_sce ///
  belief1_time_sce belief2_time_sce ///
  n_red_urn_sce n_red_ball_rurn_sce urn_sce ball1_sce ///
  belief1_dist_sce belief1_false_band_5_sce ///
  belief1_up_sce belief1_down_sce, i(id) j(scenario)

rename prior_sce prior
rename belief1_sce belief1
rename belief2_sce belief2
rename belief1_false_sce belief1_false
rename belief1_time_sce belief1_time_sec
rename belief2_time_sce belief2_time_sec
rename n_red_urn_sce n_red_urn
rename n_red_ball_rurn_sce n_red_ball_rurn
rename urn_sce urn
rename ball1_sce ball1
rename belief1_dist_sce belief1_dist
rename belief1_false_band_5_sce belief1_false_band_5
rename belief1_up_sce belief1_up
rename belief1_down_sce belief1_down

label var scenario "Scenario number"
label var prior "Objective prior"
label var belief1 "Reported prior"
label var belief2 "Reported update"

label var belief1_time_sec "Time in seconds for prior report"
label var belief2_time_sec "Time in seconds for update report"

gen belief1_time_min = belief1_time_sec/60
label var belief1_time_min "Time in minutes for prior report"

gen belief2_time_min = belief2_time_sec/60
label var belief2_time_min "Time in minutes for update report"

label var belief1_false "Misreported prior"
label var n_false_lower50 "# of misreports for prior < 50%"
label var n_false_higher50 "# of misreports for prior > 50%"

label var belief1_up "Misreporting up prior"
label var belief1_down "Misreporting down prior"

label var urn "Selected urn"
label var ball1 "1st selected ball"

label data "Full sample with analysis variables in long format"



gen belief1_dist_abs = abs(belief1_dist)


save $datadir/clean/bdm_full_sample_long.dta, replace



local date2 = c(current_date)
local time2 = c(current_time)

di "Do file clean_qualtrics_data.do start date time: `date1' `time1'"
di "End date time: `date2' `time2'"

log close
translate $projdir/log/clean_qualtrics_data.smcl ///
  $projdir/log/clean_qualtrics_data.log, replace
