********************************************************************************
/* do file to create test score VA estimates on the restricted sample that
only has observations with sibling controls and ACS controls, without teacher
fixed effects or peer effects. There are 4 differentVA specifications:
1. Primary specification without sibling controls or ACS controls
2. Primary specification plus ACS controls
3. Primary specification plus sibling controls
4. Primary Specificationv plus ACS and sibling controls */
********************************************************************************
********************************************************************************
*************** written by Che Sun. Email: ucsun@ucdavis.edu *******************
********************** First written on April 27. 2022 *************************

/* To run this do file:

do $projdir/do/share/siblingvaregs/va_sib_acs

 */


/* CHANGE LOG:

 */

clear all
set more off
set varabbrev off
set scheme s1color
//capture log close: Stata should not complain if there is no log open to close
cap log close _all

/* set trace on
set tracedepth 2 */

//starting log file
log using $projdir/log/share/siblingvaregs/va_sib_acs.smcl, replace

/* change directory to common_core_va project directory for all value added
do files because some called subroutines written by Matt may use relative file paths  */
cd $vaprojdir

/* file path macros for datasets */
include $projdir/do/share/siblingvaregs/vafilemacros.doh

//run Matt's do helper file to set the local macros for VA project
include $vaprojdir/do_files/sbac/macros_va.doh

macro list

//startomg timer
timer on 1


********************************************************************************



local drift_limit = max(`test_score_max_year' - `test_score_min_year' - 1, 1)

foreach subject in ela math {
  // load the resctricted sample with sibling and acs controls
  use $vaprojdir/data/va_samples/va_sib_acs_restr_smp.dta if touse_g11_`subject'==1, clear

  ********************************************************************************
  /* Primary test score va specification, no tfx, no peer fx, no sibling ctrl, no acs ctrl */
  ********************************************************************************
  vam sbac_`subject'_z_score ///
    , teacher(school_id) year(year) class(school_id) ///
    controls( ///
      i.year ///
      `school_controls' ///
      `demographic_controls' ///
      `ela_score_controls' ///
      `math_score_controls' ///
    ) ///
    data(merge tv score_r) ///
    driftlimit(`drift_limit') ///
    estimates($vaprojdir/estimates/sib_acs_restr_smp/test_score_va/vam_`subject'_og.ster, replace)

    // rename the va estimates and the test score residuals
    rename tv va_`subject'_og
    rename score_r `subject'_r_og
    label var va_`subject'_og "``subject'_str' VA OG Specification"
    label var `subject'_r_og "Score Residual from ``subject'_str' VA OG Specification"

    *******************
    // specification test: regress score residuals on va estimates
    reg `subject'_r_og va_`subject'_og, cluster(school_id)

    // save spec test estimates
    estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/spec_test_`subject'_og.ster, replace



    ********************************************************************************
    /* Test score VA, no tfx, no peer fx, no sibling ctrl, with acs ctrl */
    ********************************************************************************

    vam sbac_`subject'_z_score ///
      , teacher(school_id) year(year) class(school_id) ///
      controls( ///
        i.year ///
        `school_controls' ///
        `demographic_controls' ///
        `ela_score_controls' ///
        `math_score_controls' ///
        `census_controls' ///
      ) ///
      data(merge tv score_r) ///
      driftlimit(`drift_limit') ///
      estimates($vaprojdir/estimates/sib_acs_restr_smp/test_score_va/vam_`subject'_acs.ster, replace)

    // rename va estimates and score residuals
    rename tv va_`subject'_acs
    rename score_r `subject'_r_acs
    label var va_`subject'_acs "``subject'_str' VA with Census Controls"
    label var `subject'_r_acs "Score Residual from ``subject'_str' VA with Census Controls"


    *******************
    // specification test: regress score residuals on va estimates
    reg `subject'_r_acs va_`subject'_acs, cluster(school_id)

    estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/spec_test_`subject'_acs.ster, replace

    *******************
    // forecast bias test for ACS leave out vars

    // difference in score residuals
    gen `subject'_r_d_og_acs = `subject'_r_og - `subject'_r_acs
    // fb test
    reg `subject'_r_d_og_acs va_`subject'_og, cluster(school_id)
    estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/fb_test_`subject'_acs_og.ster, replace



    ********************************************************************************
    /* Test score VA, no tfx, no peer fx, with sibling ctrl, no acs ctrl */
    ********************************************************************************
    vam sbac_`subject'_z_score ///
      , teacher(school_id) year(year) class(school_id) ///
      controls( ///
        i.year ///
        `school_controls' ///
        `demographic_controls' ///
        `ela_score_controls' ///
        `math_score_controls' ///
        `sibling_controls' ///
      ) ///
      data(merge tv score_r) ///
      driftlimit(`drift_limit') ///
      estimates($vaprojdir/estimates/sib_acs_restr_smp/test_score_va/vam_`subject'_sib.ster, replace)

    //rename va estimates sand score residuals
    rename tv va_`subject'_sib
    rename score_r `subject'_r_sib
    label var va_`subject'_sib "``subject'_str' VA with Sibling Controls"
    label var `subject'_r_sib "Score Residual from ``subject'_str' VA with Sibling Controls"

    *******************
    // specification test: regress score residuals on va estimates
    reg `subject'_r_sib va_`subject'_sib, cluster(school_id)

    estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/spec_test_`subject'_sib.ster, replace


    *******************
    // forecast bias test for sibling controls as leave out vars
    // difference in score residuals
    gen `subject'_r_d_og_sib = `subject'_r_og - `subject'_r_sib
    // fb test
    reg `subject'_r_d_og_sib va_`subject'_og, cluster(school_id)
    estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/fb_test_`subject'_sib_og.ster, replace




    ********************************************************************************
    /* Test score VA, no tfx, no peer fx, with sibling ctrl, with acs ctrl */
    ********************************************************************************
    vam sbac_`subject'_z_score ///
      , teacher(school_id) year(year) class(school_id) ///
      controls( ///
        i.year ///
        `school_controls' ///
        `demographic_controls' ///
        `ela_score_controls' ///
        `math_score_controls' ///
        `sibling_controls' ///
        `census_controls' ///
      ) ///
      data(merge tv score_r) ///
      driftlimit(`drift_limit') ///
      estimates($vaprojdir/estimates/sib_acs_restr_smp/test_score_va/vam_`subject'_both.ster, replace)

      //rename va estimates sand score residuals
      rename tv va_`subject'_both
      rename score_r `subject'_r_both
      label var va_`subject'_both "``subject'_str' VA with Sibling and Census Controls"
      label var `subject'_r_both "Score Residual from ``subject'_str' VA with Sibling and Census Controls"

      *******************
      // specification test: regress score residuals on va estimates
      reg `subject'_r_both va_`subject'_both, cluster(school_id)

      estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/spec_test_`subject'_both.ster, replace


      *******************
      // forecast bias test for sibling controls as leave out vars against specification with only census controls
      // difference in score residuals with census controls and residuals with both census and sibling controls
      gen `subject'_r_d_acs_both = `subject'_r_acs - `subject'_r_both
      // fb test
      reg `subject'_r_d_acs_both va_`subject'_acs, cluster(school_id)
      //naming convention: forecast bias test for leave out variables being sibling controls, against VA with only acs controls
      estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/fb_test_`subject'_sib_acs.ster, replace


      *******************
      // forecast bias test for census controls as leave out vars against specification with only sibling controls
      // difference in score residuals with census controls and residuals with both census and sibling controls
      gen `subject'_r_d_sib_both = `subject'_r_sib - `subject'_r_both
      // fb test
      reg `subject'_r_d_sib_both va_`subject'_sib, cluster(school_id)
      estimates save $vaprojdir/estimates/sib_acs_restr_smp/test_score_va/fb_test_`subject'_acs_sib.ster, replace





      ********* Save VA estimates
      collapse (firstnm) va_* ///
        (mean) `subject'* ///
        (sum) n_g11_`subject' = touse_g11_`subject' ///
        , by(school_id cdscode grade year)
      // save to VA project data folder
      save $vaprojdir/data/sib_acs_restr_smp/test_score_va/va_`subject'_sib_acs.dta, replace



}


timer off 1
timer list

//change directory back to my own personal directory
cd $projdir

log close
translate $projdir/log/share/siblingvaregs/va_sib_acs.smcl $projdir/log/share/siblingvaregs/va_sib_acs.log, replace
