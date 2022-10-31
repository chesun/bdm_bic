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
  , aspectratio(1)  ysize(6)  xsize(6)
  ytitle("Fraction of false reports, tolerance band of 5", margin(zero) size(small))
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

graph export $projdir/out/fig/false_by_period_tol5.pdf, replace as(pdf)


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



//------------------------------------------------------------------------
// scatter plots percentage of misreports by prior
//------------------------------------------------------------------------

use `full_sample', clear

// Generate consecutive numbers on x-axis for each prior:
generate catvar = .

local val = 0
levelsof prior, local(levelsofvar)
foreach p of local levelsofvar {
    local val = `val'+1
    replace catvar = `val' +  0 if prior == `p'
}

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
  (bar pct_false1 catvar if full_info==1, lwidth(0.1) lcolor(white) fcolor(midblue))
  (rcap hi_95ci lo_95ci catvar if full_info==1, lcolor(black) msize(small) lwidth(vthin))
  , ytitle("Fraction of false reports", margin(zero) size(medlarge))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(off)
  plotregion(margin(medsmall))
  text(0.02 1 "0.1", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 2 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 3 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 4 "0.4", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 5 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 6 "0.6", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 7 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 8 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge))
  text(0.02 9 "0.9", placement(n) orientation(horizontal) color(white) size(medlarge))
  ;
#delimit cr

graph export $projdir/out/fig/false_by_prior.pdf, replace as(pdf)


//------------------------------------------------------------------------
// scatter plots of direction of misreports by prior
//------------------------------------------------------------------------
restore, preserve

// pct of misreports up and down by prior

collapse (mean) catvar pct_false1=belief1_false pct_false1_band_5=belief1_false_band_5 ///
  pct_up = belief1_up pct_down = belief1_down ///
  (count) n = belief1_false, by(full_info prior)

sort catvar full_info

// scatter plot
#delimit ;
graph twoway
  (scatter pct_up catvar if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter pct_down catvar if full_info==1, connect(direct)
  msize(small)  lpattern(solid) color(black))
  , ytitle("Fraction of false report direction in Full Info", margin(zero) size(small))
  xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(.05)1)
  ymtick(0(.01)1)
  ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
  graphregion(color(white) margin(zero))
  legend(label(1 "Up") label(2 "Down"))
  plotregion(margin(medsmall))
  text(0.02 1 "0.1", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 2 "0.2", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 3 "0.3", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 4 "0.4", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 5 "0.5", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 6 "0.6", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 7 "0.7", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 8 "0.8", placement(n) orientation(horizontal) color(black) size(med))
  text(0.02 9 "0.9", placement(n) orientation(horizontal) color(black) size(med))
  ;
#delimit cr

graph export $projdir/out/fig/false_direction_by_prior.pdf, replace as(pdf)


restore, preserve
replace belief1_up = 0 if belief1_false_band_5==0
replace belief1_down = 0 if belief1_false_band_5==0

collapse (mean) catvar  pct_up = belief1_up pct_down = belief1_down ///
  (count) n = belief1_false, by(full_info prior)

sort catvar full_info


// scatter plot, false report defined with tolerance band of 5
  #delimit ;
  graph twoway
    (scatter pct_up catvar if full_info==1, connect(direct) msymbol(T)
    msize(small)  lpattern(solid) color(midblue))
    (scatter pct_down catvar if full_info==1, connect(direct)
    msize(small)  lpattern(solid) color(black))
    , ytitle("Fraction of false report direction in Full Info, tolerance band of 5", margin(zero) size(small))
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

graph export $projdir/out/fig/false_direction_by_prior_tol5.pdf, replace as(pdf)




local date2 = c(current_date)
local time2 = c(current_time)

di "Do file prelim_figures.do start date time: `date1' `time1'"
di "End date time: `date2' `time2'"

log close
translate $projdir/log/prelim_figures.smcl ///
  $projdir/log/prelim_figures.log, replace
