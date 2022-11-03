********************************************************************************
/* clean demographics data from prolific */
********************************************************************************
************************ Written by Christina Sun 10/29/2022 *******************

/* Change Log:
*/



 /* to run this do file:
 do ./do/clean/clean_prolific_demo.do
 */

cap log close _all

log using $projdir/log/clean_prolific_demo.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color
set seed 1984

set trace off


foreach date in 10_24_2022 10_26_2022 {

  import delimited using $datadir/raw/prolific_demo_`date', clear


  drop submissionid status startedat completedat reviewedat archivedat ///
    completioncode country* language studentstatus

  // format string vars data expired as missing

  // list of string vars and numeric vars

  ds, has(type string)
  local stringvars `r(varlist)'

  foreach var of varlist `stringvars' {
      replace `var' = "" if `var' == "DATA_EXPIRED"
  }


  destring age, replace



  gen sex_f = .
  replace sex_f = 1 if sex == "Female"
  replace sex_f = 0 if sex == "Male"
  //recode missing values for value label
  recode sex_f (missing = .a)

  label define sex_f 1 "Female" 0 "Male" .a "Prefer not to say"
  label values sex_f sex_f
  label var sex_f "Sex is Female from Prolific"



  rename participantid prolific_pid

  rename timetaken duration_p
  label var duration_p "Time taken on Prolific"

  rename totalapprovals totalapprovals_p
  label var totalapprovals_p "Total approvals on Prolific"

  rename fluentlanguages languages_p
  label var languages_p "Fluent languages from Prolific"

  rename age age_p
  label var age_p "Age from Prolific"

  rename sex sex_p
  label var sex_p "Sex from Prolific"

  rename ethnicitysimplified ethnicity_p
  label var ethnicity_p "Ethnicity from Prolific"

  rename nationality nationality_p
  label var nationality_p "Nationality from Prolific"

  rename employmentstatus employ_p
  label var employ_p "Employment status from Prolific"





  save $datadir/clean/prolific_demo_`date', replace


}












log close
translate $projdir/log/clean_prolific_demo.smcl ///
  $projdir/log/clean_prolific_demo.log, replace
