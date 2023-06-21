********************************************************************************
/*preliminary figures */
********************************************************************************
************************ Written by Christina Sun 10/30/2022 *******************


/* Change Log: */



 /* to run this do file:
 do ./do/share/prelim_figures.do
 */

cap log close _all

log using $projdir/log/prelim_figures.smcl, replace

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
// scatter plot of percentage of false reports by scenario
//------------------------------------------------------------------------

collapse (mean) pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
  bdm_check_pass_all = bdm_check_pass_all ///
  (sd) sd_false1 = belief1_false sd_false1_band_5 = belief1_false_band_5 ///
  (count) n = belief1_false, by(full_info scenario)

// high and low bounds for 95% confidence interval
gen hi_95ci = pct_false1 + invttail(n-1,0.025)*(sd_false1 / sqrt(n))
gen lo_95ci = pct_false1 - invttail(n-1,0.025)*(sd_false1 / sqrt(n))

gen hi_95ci_band_5 = pct_false1_band_5 + invttail(n-1,0.025)*(sd_false1_band_5 / sqrt(n))
gen lo_95ci_band_5 = pct_false1_band_5 - invttail(n-1,0.025)*(sd_false1_band_5 / sqrt(n))

// strict definition of false report
#delimit ;
graph twoway
  (scatter pct_false1 scenario if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (rcap hi_95ci lo_95ci scenario if full_info==1,
  lcolor(midblue) msize(small) lwidth(vthin))
  (scatter pct_false1 scenario if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  (rcap hi_95ci lo_95ci scenario if full_info==0,
  lcolor(black) msize(small) lwidth(vthin))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false reports", margin(zero) size(medlarge))
  xtitle("Scenario", margin(small) size(medlarge))
  ymtick(0(.01)1, tlwidth(vthin))
  ytick(0(.05)1, tlwidth(vthin))
  ylabel(0(0.1)1)
  xlabel(1(1)9)
  legend(order(1 3) label(1 "Full Info") label(3 "No Info"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/false_by_period.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_by_period.pdf", replace as(pdf)

// false reports defined with tolerance band of 5
#delimit ;
graph twoway
  (scatter pct_false1_band_5 scenario if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (rcap hi_95ci_band_5 lo_95ci_band_5 scenario if full_info==1,
  lcolor(midblue) msize(small) lwidth(vthin))
  (scatter pct_false1_band_5 scenario if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  (rcap hi_95ci_band_5 lo_95ci_band_5 scenario if full_info==0,
  lcolor(black) msize(small) lwidth(vthin))
  ,
  ytitle("Fraction of false reports, tolerance band of 5", margin(zero) size(small))
  xtitle("Scenario", margin(small) size(medlarge))
  title("False Reports with Tolerance, By Treatment", size(med))
  ymtick(0(.01)1, tlwidth(vthin))
  ytick(0(.05)1, tlwidth(vthin))
  ylabel(0(0.1)1)
  xlabel(1(1)9)
  legend(order(1 3) label(1 "Full Info") label(3 "No Info"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/false_by_period_tol5.pdf, replace as(pdf)
graph export  "$overleafdir/figures/false_by_period_tol5.pdf", replace as(pdf)

//------------------------------------------------------------------------
// scatter plots by whether subject passed all BDM understanding checks
//------------------------------------------------------------------------

use `full_sample', clear

collapse (mean) pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
  (sd) sd_false1 = belief1_false sd_false1_band_5 = belief1_false_band_5 ///
  (count) n = belief1_false, by(full_info scenario bdm_check_pass_all)

gen hi_95ci = pct_false1 + invttail(n-1,0.025)*(sd_false1 / sqrt(n))
gen lo_95ci = pct_false1 - invttail(n-1,0.025)*(sd_false1 / sqrt(n))

gen hi_95ci_band_5 = pct_false1_band_5 + invttail(n-1,0.025)*(sd_false1_band_5 / sqrt(n))
gen lo_95ci_band_5 = pct_false1_band_5 - invttail(n-1,0.025)*(sd_false1_band_5 / sqrt(n))

// strict definition of false reports
#delimit ;
graph twoway
  (scatter pct_false1 scenario if full_info==1 & bdm_check_pass_all==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (rcap hi_95ci lo_95ci scenario if full_info==1 & bdm_check_pass_all==0,
  lcolor(midblue) msize(small) lwidth(vthin))
  (scatter pct_false1 scenario if full_info==1 & bdm_check_pass_all==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(orange_red))
  (rcap hi_95ci lo_95ci scenario if full_info==1 & bdm_check_pass_all==1,
  lcolor(orange_red) msize(small) lwidth(vthin))
  (scatter pct_false1 scenario if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  (rcap hi_95ci lo_95ci scenario if full_info==0,
  lcolor(black) msize(small) lwidth(vthin))
  ,   ytitle("Fraction of false reports", margin(zero) size(medlarge))
  xtitle("Scenario", margin(small) size(medlarge))
  ymtick(0(.01)1, tlwidth(vthin))
  ytick(0(.05)1, tlwidth(vthin))
  ylabel(0(0.1)1)
  xlabel(1(1)9)
  legend(order(1 3 5) label(1 "Full Info, Confusion") label(3 "Full Info, Understanding") label(5 "No Info"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/false_by_period_udst.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_by_period_udst.pdf", replace as(pdf)

// false reports defined with tolernace band of 5
#delimit ;
graph twoway
  (scatter pct_false1_band_5 scenario if full_info==1 & bdm_check_pass_all==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (rcap hi_95ci_band_5 lo_95ci_band_5 scenario if full_info==1 & bdm_check_pass_all==0,
  lcolor(midblue) msize(small) lwidth(vthin))
  (scatter pct_false1_band_5 scenario if full_info==1 & bdm_check_pass_all==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(orange_red))
  (rcap hi_95ci_band_5 lo_95ci_band_5 scenario if full_info==1 & bdm_check_pass_all==1,
  lcolor(orange_red) msize(small) lwidth(vthin))
  (scatter pct_false1_band_5 scenario if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  (rcap hi_95ci_band_5 lo_95ci_band_5 scenario if full_info==0,
  lcolor(black) msize(small) lwidth(vthin))
  ,   ytitle("Fraction of false reports, tolerance band of 5", margin(zero) size(small))
  xtitle("Scenario", margin(small) size(medlarge))
  title("False Reports with Tolerance, By Understanding", size(med))
  ymtick(0(.01)1, tlwidth(vthin))
  ytick(0(.05)1, tlwidth(vthin))
  ylabel(0(0.1)1)
  xlabel(1(1)9)
  legend(order(1 3 5) label(1 "Full Info, Confusion") label(3 "Full Info, Understanding") label(5 "No Info"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/false_by_period_udst_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_by_period_udst_tol5.pdf", replace as(pdf)


//------------------------------------------------------------------------
// scatter plots percentage of misreports by prior
//------------------------------------------------------------------------

use `full_sample', clear


preserve

// pct of misreports per prior and confidence intervals:
collapse (mean) catvar pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
  (sd) sd_false1 = belief1_false sd_false1_band_5 = belief1_false_band_5 ///
  (count) n = belief1_false, by(full_info prior)

gen hi_95ci = pct_false1 + invttail(n-1,0.025)*(sd_false1 / sqrt(n))
gen lo_95ci = pct_false1 - invttail(n-1,0.025)*(sd_false1 / sqrt(n))

// false report defined strictly

#delimit ;
graph twoway
  (scatter pct_false1 catvar if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (rcap hi_95ci lo_95ci catvar if full_info==1, lcolor(midblue) msize(small) lwidth(vthin))
  (scatter pct_false1 catvar if full_info==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(black))
  (rcap hi_95ci lo_95ci catvar if full_info==1, lcolor(black) msize(small) lwidth(vthin))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false reports", margin(zero) size(medlarge))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(order(1 3) label(1 "Full Info") label(3 "No Info"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/false_by_prior.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_by_prior.pdf", replace as(pdf)


//------------------------------------------------------------------------
// scatter plots of direction of misreports by prior
//------------------------------------------------------------------------
restore, preserve

// pct of misreports up and down by prior

collapse (mean) catvar pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
  pct_up = belief1_up pct_down = belief1_down ///
  (count) n = belief1_false, by(full_info prior)

sort catvar full_info

// scatter plot for full info treatment
#delimit ;
graph twoway
  (scatter pct_up catvar if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if full_info==1, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false report direction in Full Info", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/false_direction_by_prior_full_info.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_full_info.pdf", replace as(pdf)



// scatter plot for No info treatment
#delimit ;
graph twoway
  (scatter pct_up catvar if full_info==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false report direction in No Info", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/false_direction_by_prior_no_info.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_no_info.pdf", replace as(pdf)



restore, preserve
replace belief1_up = 0 if belief1_false_band_5==0
replace belief1_down = 0 if belief1_false_band_5==0

collapse (mean) catvar  pct_up = belief1_up pct_down = belief1_down ///
  (count) n = belief1_false, by(full_info prior)

sort catvar full_info


// scatter plot, false report defined with tolerance band of 5 for Full Info
  #delimit ;
  graph twoway
    (scatter pct_up catvar if full_info==1, connect(direct) msymbol(T)
    msize(small)  lpattern(solid) color(midblue))
    (scatter pct_down catvar if full_info==1, connect(direct)
    msize(small)  lpattern(solid) color(black))
    , aspectratio(1)  ysize(6)  xsize(6)
    ytitle("Fraction of false report direction in Full Info, tolerance band of 5", margin(zero) size(small))
    xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
    xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
    ytick(0(.05)1)
    ymtick(0(.01)1)
    ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
    graphregion(color(white) margin(zero))
    legend(label(1 "Up") label(2 "Down"))
    plotregion(margin(medsmall))
    text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
    ;
#delimit cr

graph export $projdir/out/fig/false_direction_by_prior_full_info_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_full_info_tol5.pdf", replace as(pdf)


// scatter plot, false report defined with tolerance band of 5 for No Info
  #delimit ;
  graph twoway
    (scatter pct_up catvar if full_info==0, connect(direct) msymbol(T)
    msize(small)  lpattern(solid) color(midblue))
    (scatter pct_down catvar if full_info==0, connect(direct)
    msize(small)  lpattern(solid) color(black))
    , aspectratio(1)  ysize(6)  xsize(6)
    ytitle("Fraction of false report direction in Full Info, tolerance band of 5", margin(zero) size(small))
    xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
    xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
    ytick(0(.05)1)
    ymtick(0(.01)1)
    ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
    graphregion(color(white) margin(zero))
    legend(label(1 "Up") label(2 "Down"))
    plotregion(margin(medsmall))
    text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
    text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
    ;
#delimit cr

graph export $projdir/out/fig/false_direction_by_prior_no_info_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_no_info_tol5.pdf", replace as(pdf)




//------------------------------------------------------------------------
// scatter plot for directino of misreporting for confused and understanding subjects in full info
//------------------------------------------------------------------------


//---------------------------------------------------------
// strict definition false reports
//---------------------------------------------------------
restore, preserve
// pct of misreports up and down by incentive understanding
keep if full_info==1
keep if bdm_check_pass_all!=.

collapse (mean) catvar pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
  pct_up = belief1_up pct_down = belief1_down ///
  (count) n = belief1_false, by(prior bdm_check_pass_all)

sort catvar bdm_check_pass_all

// scatter plot for understanding subjects
#delimit ;
graph twoway
  (scatter pct_up catvar if bdm_check_pass_all==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if bdm_check_pass_all==1, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false report direction for understanding subjects", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Understanding Subjects", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/fals_direction_by_prior_understand.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_understand.pdf", replace as(pdf)


// scatter plot for confused subjects
#delimit ;
graph twoway
  (scatter pct_up catvar if bdm_check_pass_all==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if bdm_check_pass_all==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false report direction for confused subjects", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Confused Subjects", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/fals_direction_by_prior_confused.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_confused.pdf", replace as(pdf)



//---------------------------------------------------------
// tolerance band 5 definition false reports
//---------------------------------------------------------

restore, preserve

//toleraence band of 5 definition of false reports
replace belief1_up = 0 if belief1_false_band_5==0
replace belief1_down = 0 if belief1_false_band_5==0

// pct of misreports up and down by incentive understanding
keep if full_info==1
keep if bdm_check_pass_all!=.

collapse (mean) catvar pct_false1=belief1_false  ///
  pct_up = belief1_up pct_down = belief1_down ///
  (count) n = belief1_false, by(prior bdm_check_pass_all)

sort catvar bdm_check_pass_all

// scatter plot for understanding subjects
#delimit ;
graph twoway
  (scatter pct_up catvar if bdm_check_pass_all==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if bdm_check_pass_all==1, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false report direction, tolerance band of 5", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Understanding Subjects, with Tolerance", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/false_direction_by_prior_understand_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_understand_tol5.pdf", replace as(pdf)


// scatter plot for confused subjects
#delimit ;
graph twoway
  (scatter pct_up catvar if bdm_check_pass_all==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if bdm_check_pass_all==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false report direction, tolerance band of 5", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Confused Subjects, with Tolerance", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/fals_direction_by_prior_confused_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/false_direction_by_prior_confused_tol5.pdf", replace as(pdf)





//------------------------------------------------------------------------
// false reports by treatment, probability coursework, and scenario
//------------------------------------------------------------------------





  //---------------------------------------------------------
  // strict definition false reports
  //---------------------------------------------------------

  restore, preserve

  collapse (mean) pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
    (count) n = belief1_false, by(scenario full_info probability_course)



    // scatter plot for strict definition of false reports, full info
    #delimit ;
    graph twoway
      (scatter pct_false1 scenario if full_info==1 & probability_course==1, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(midblue))
      (scatter pct_false1 scenario if full_info==1 & probability_course==0, connect(direct)
      msize(small)  lpattern(solid) color(black))
      ,  aspectratio(1)  ysize(6)  xsize(6)
      ytitle("Fraction of false reports", margin(zero) size(medsmall))
      xtitle("Scenario", margin(small) size(medlarge))
      title("Fraction of False Reports in Full Info Treatment", size(small))
      ymtick(0(.01)1, tlwidth(vthin))
      ytick(0(.05)1, tlwidth(vthin))
      ylabel(0(0.1)1)
      xlabel(1(1)9)
      legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
      graphregion(color(white) margin(zero))
      plotregion(margin(medsmall))
      ;
    #delimit cr

    graph export $projdir/out/fig/false_by_period_prob_course_full_info.pdf, replace as(pdf)
    graph export "$overleafdir/figures/false_by_period_prob_course_full_info.pdf", replace as(pdf)


    // scatter plot for strict definition of false reports, No info
    #delimit ;
    graph twoway
      (scatter pct_false1 scenario if full_info==0 & probability_course==1, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(midblue))
      (scatter pct_false1 scenario if full_info==0 & probability_course==0, connect(direct)
      msize(small)  lpattern(solid) color(black))
      ,  aspectratio(1)  ysize(6)  xsize(6)
      ytitle("Fraction of false reports", margin(zero) size(medsmall))
      xtitle("Scenario", margin(small) size(medlarge))
      title("Fraction of False Reports in No Info Treatment", size(small))
      ymtick(0(.01)1, tlwidth(vthin))
      ytick(0(.05)1, tlwidth(vthin))
      ylabel(0(0.1)1)
      xlabel(1(1)9)
      legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
      graphregion(color(white) margin(zero))
      plotregion(margin(medsmall))
      ;
    #delimit cr

    graph export $projdir/out/fig/false_by_period_prob_course_no_info.pdf, replace as(pdf)
    graph export "$overleafdir/figures/false_by_period_prob_course_no_info.pdf", replace as(pdf)




    //---------------------------------------------------------
    // tolerance band 5 definition false reports
    //---------------------------------------------------------

    // scatter plot for tolerance band 5 definition of false reports, full info
    #delimit ;
    graph twoway
      (scatter pct_false1_band_5 scenario if full_info==1 & probability_course==1, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(midblue))
      (scatter pct_false1_band_5 scenario if full_info==1 & probability_course==0, connect(direct)
      msize(small)  lpattern(solid) color(black))
      ,  aspectratio(1)  ysize(6)  xsize(6)
      ytitle("Fraction of false reports", margin(zero) size(medsmall))
      xtitle("Scenario", margin(small) size(medlarge))
      title("Fraction of False Reports in Full Info Treatment, with Tolerance", size(small))
      ymtick(0(.01)1, tlwidth(vthin))
      ytick(0(.05)1, tlwidth(vthin))
      ylabel(0(0.1)1)
      xlabel(1(1)9)
      legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
      graphregion(color(white) margin(zero))
      plotregion(margin(medsmall))
      ;
    #delimit cr

    graph export $projdir/out/fig/false_by_period_prob_course_full_info_tol5.pdf, replace as(pdf)
    graph export "$overleafdir/figures/false_by_period_prob_course_full_info_tol5.pdf", replace as(pdf)


    // scatter plot for tolerance band 5 definition of false reports, No info
    #delimit ;
    graph twoway
      (scatter pct_false1_band_5 scenario if full_info==0 & probability_course==1, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(midblue))
      (scatter pct_false1_band_5 scenario if full_info==0 & probability_course==0, connect(direct)
      msize(small)  lpattern(solid) color(black))
      ,  aspectratio(1)  ysize(6)  xsize(6)
      ytitle("Fraction of false reports", margin(zero) size(medsmall))
      xtitle("Scenario", margin(small) size(medlarge))
      title("Fraction of False Reports in No Info Treatment, with Tolerance", size(small))
      ymtick(0(.01)1, tlwidth(vthin))
      ytick(0(.05)1, tlwidth(vthin))
      ylabel(0(0.1)1)
      xlabel(1(1)9)
      legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
      graphregion(color(white) margin(zero))
      plotregion(margin(medsmall))
      ;
    #delimit cr

    graph export $projdir/out/fig/false_by_period_prob_course_no_info_tol5.pdf, replace as(pdf)
    graph export "$overleafdir/figures/false_by_period_prob_course_no_info_tol5.pdf", replace as(pdf)
















//------------------------------------------------------------------------
// magnitude of misreports by treatment and prior, with tolerance band of 5
//------------------------------------------------------------------------

restore, preserve

keep if belief1_dist_abs >5

collapse (mean) catvar mean_abs_dist=belief1_dist_abs ///
  (count) n = belief1_false, by(prior full_info)

sort catvar full_info

// scatter plot
#delimit ;
graph twoway
  (scatter mean_abs_dist catvar if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter mean_abs_dist catvar if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  ,
  ytitle("Mean Absolute Deviation", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Mean Absolute Deviation in False Reports, with Tolerance", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(5)30)
  ymtick(0(1)30)
  ylabel(0(5)30,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.0f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Full Info") label(2 "No Info"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/mean_abs_dist_by_prior_treat_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/mean_abs_dist_by_prior_treat_tol5.pdf", replace as(pdf)




//------------------------------------------------------------------------
// magnitude of misreports by understanding and prior, strict and tolerance
//------------------------------------------------------------------------
restore, preserve

keep if full_info==1
keep if bdm_check_pass_all!=.

collapse (mean) catvar mean_abs_dist=belief1_dist_abs ///
  (count) n = belief1_false, by(prior bdm_check_pass_all)

sort catvar bdm_check_pass_all

// scatter plot, strict
#delimit ;
graph twoway
  (scatter mean_abs_dist catvar if bdm_check_pass_all==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter mean_abs_dist catvar if bdm_check_pass_all==1, connect(direct)
  msize(small)  lpattern(solid) color(black))
  ,
  ytitle("Mean Absolute Deviation", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Mean Absolute Deviation in False Reports", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(5)30)
  ymtick(0(1)30)
  ylabel(0(5)30,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.0f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Confused") label(2 "Understanding"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/mean_abs_dist_by_prior_udst.pdf, replace as(pdf)
graph export "$overleafdir/figures/mean_abs_dist_by_prior_udst.pdf", replace as(pdf)


// scatter plot, tolerance band of 5
restore, preserve

keep if full_info==1
keep if bdm_check_pass_all!=.
keep if belief1_dist_abs >5


collapse (mean) catvar mean_abs_dist=belief1_dist_abs ///
  (count) n = belief1_false, by(prior bdm_check_pass_all)

sort catvar bdm_check_pass_all

#delimit ;
graph twoway
  (scatter mean_abs_dist catvar if bdm_check_pass_all==0, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter mean_abs_dist catvar if bdm_check_pass_all==1, connect(direct)
  msize(small)  lpattern(solid) color(black))
  ,
  ytitle("Mean Absolute Deviation", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  title("Mean Absolute Deviation in False Reports, with Tolerance", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(5)30)
  ymtick(0(1)30)
  ylabel(0(5)30,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.0f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Confused") label(2 "Understanding"))
  plotregion(margin(medsmall))
  text(-0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
  text(-0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
  ;
#delimit cr

graph export $projdir/out/fig/mean_abs_dist_by_prior_udst_tol5.pdf, replace as(pdf)
graph export "$overleafdir/figures/mean_abs_dist_by_prior_udst_tol5.pdf", replace as(pdf)



//------------------------------------------------------------------------
// time taken for priors by treatment and scenario
//------------------------------------------------------------------------

restore, preserve

collapse (mean) catvar mean_belief1_time_sec=belief1_time_sec ///
  (count) n = belief1_false, by(scenario full_info)

sort scenario full_info


#delimit ;
graph twoway
  (scatter mean_belief1_time_sec scenario if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter mean_belief1_time_sec scenario if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  ,
  ytitle("Time Taken in Seconds", margin(zero) size(small))
  xtitle("Scenario", margin(small) size(medlarge) )
  title("Average Time Taken for Priors, in Seconds", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(10)50)
  ymtick(0(5)50)
  ylabel(0(10)50,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.0f) labsize(medlarge))
  xlabel(1(1)9)
  legend(order(1 3) label(1 "Full Info") label(3 "No Info"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/mean_time_sec_by_scenario.pdf, replace as(pdf)
graph export "$overleafdir/figures/mean_time_sec_by_scenario.pdf", replace as(pdf)









local date2 = c(current_date)
local time2 = c(current_time)

di "Do file prelim_figures.do start date time: `date1' `time1'"
di "End date time: `date2' `time2'"

log close
translate $projdir/log/prelim_figures.smcl ///
  $projdir/log/prelim_figures.log, replace
