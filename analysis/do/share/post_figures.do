********************************************************************************
/* figures results on the posterior */
********************************************************************************
************************ Written by Christina Sun 11/03/2022 *******************


/* Change Log: */



 /* to run this do file:
 do ./do/share/post_figures.do
 */

cap log close _all

log using $projdir/log/post_figures.smcl, replace

graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color
set seed 1984



// load data
use $datadir/clean/bdm_full_sample_long, clear

preserve




//------------------------------------------------------------------------
// time taken for updates by treatment and scenario
//------------------------------------------------------------------------


collapse (mean) mean_belief2_time_sec =belief2_time_sec ///
  (count) n = belief2_time_sec, by(scenario full_info)

sort scenario full_info


#delimit ;
graph twoway
  (scatter mean_belief2_time_sec scenario if full_info==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter mean_belief2_time_sec scenario if full_info==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  ,
  ytitle("Time Taken in Seconds", margin(zero) size(small))
  xtitle("Scenario", margin(small) size(medlarge) )
  title("Average Time Taken for Updates, in Seconds", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(10)50)
  ymtick(0(5)50)
  ylabel(0(10)50,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.0f) labsize(medlarge))
  xlabel(1(1)9)
  legend(order(1 2) label(1 "Full Info") label(2 "No Info"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/update/mean_time_sec_by_scenario.pdf, replace as(pdf)
graph export "$overleafdir/figures/update/mean_time_sec_by_scenario.pdf", replace as(pdf)



//------------------------------------------------------------------------
// time for update by treatment, probability coursework, and scenario
//------------------------------------------------------------------------

restore, preserve

collapse (mean) mean_belief2_time_sec =belief2_time_sec ///
  (count) n = belief2_time_sec, by(scenario probability_course)

sort scenario probability_course


#delimit ;
graph twoway
  (scatter mean_belief2_time_sec scenario if probability_course==1, connect(direct) msymbol(T)
  msize(small)  lpattern(solid) color(midblue))
  (scatter mean_belief2_time_sec scenario if probability_course==0, connect(direct)
  msize(small)  lpattern(solid) color(black))
  ,
  ytitle("Time Taken in Seconds", margin(zero) size(small))
  xtitle("Scenario", margin(small) size(medlarge) )
  title("Average Time Taken for Updates, in Seconds", size(med))
  xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
  ytick(0(10)50)
  ymtick(0(5)50)
  ylabel(0(10)50,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.0f) labsize(medlarge))
  xlabel(1(1)9)
  legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
  graphregion(color(white) margin(zero))
  plotregion(margin(medsmall))
  ;
#delimit cr

graph export $projdir/out/fig/update/mean_time_sec_by_scenario_prob_course.pdf, replace as(pdf)
graph export "$overleafdir/figures/update/mean_time_sec_by_scenario_prob_course.pdf", replace as(pdf)



//------------------------------------------------------------------------
// correct direction of updates by prior and treatment
//------------------------------------------------------------------------
restore, preserve


collapse (mean) catvar pct_update_dir_correct = update_dir_correct ///
  mean_bayes_revision = bayes_revision ///
  mean_actual_revision = actual_revision ///
  (count) n = bayes_revision, by(prior full_info)


  #delimit ;
  graph twoway
    (scatter pct_update_dir_correct catvar if full_info==1, connect(direct) msymbol(T)
    msize(small)  lpattern(solid) color(midblue))
    (scatter pct_update_dir_correct catvar if full_info==0, connect(direct)
    msize(small)  lpattern(solid) color(black))
    ,
    ytitle("Fraction of false reports", margin(zero) size(medlarge))
    xtitle("Scenario", margin(small) size(medlarge))
    title("Fraction of Correct Direction Updates", size(med))
    ymtick(0(.01)1, tlwidth(vthin))
    ytick(0(.05)1, tlwidth(vthin))
    ylabel(0(0.1)1)
    xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
    legend(order(1 2) label(1 "Full Info") label(2 "No Info"))
    graphregion(color(white) margin(zero))
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

  graph export $projdir/out/fig/update/update_dir_correct_by_prior_treat.pdf, replace as(pdf)
  graph export "$overleafdir/figures/update/update_dir_correct_by_prior_treat.pdf", replace as(pdf)




  //------------------------------------------------------------------------
  // mean absolute deviation of updates by prior and probability course
  //------------------------------------------------------------------------
  restore, preserve


  collapse (mean) catvar mean_belief2_dist = belief2_dist_abs ///
    (count) n = belief1_dist, by(prior probability_course)

local prior_pos -0.02

    #delimit ;
    graph twoway
      (scatter mean_belief2_dist catvar if probability_course==1, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(midblue))
      (scatter mean_belief2_dist catvar if probability_course==0, connect(direct)
      msize(small)  lpattern(solid) color(black))
      ,
      ytitle("Fraction of false reports", margin(zero) size(medlarge))
      xtitle("Scenario", margin(small) size(medlarge))
      title("Mean Absolute Deviation from Bayesian Posterior by Probability Coursework", size(med))
      ymtick(0(1)25, tlwidth(vvthin))
      ytick(0(5)25, tlwidth(vthin))
      ylabel(0(5)25)
      xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
      legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
      graphregion(color(white) margin(zero))
      plotregion(margin(medsmall))
      text(`prior_pos' 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
      ;
    #delimit cr

    graph export $projdir/out/fig/update/mean_abs_dist_by_prior_prob_course.pdf, replace as(pdf)
    graph export "$overleafdir/figures/update/mean_abs_dist_by_prior_prob_course.pdf", replace as(pdf)



    //------------------------------------------------------------------------
    // mean absolute deviation of updates by prior and treatment
    //------------------------------------------------------------------------
    restore, preserve


    collapse (mean) catvar mean_belief2_dist = belief2_dist_abs ///
      (count) n = belief1_dist, by(prior full_info)

  local prior_pos -0.02

      #delimit ;
      graph twoway
        (scatter mean_belief2_dist catvar if full_info==1, connect(direct) msymbol(T)
        msize(small)  lpattern(solid) color(midblue))
        (scatter mean_belief2_dist catvar if full_info==0, connect(direct)
        msize(small)  lpattern(solid) color(black))
        ,
        ytitle("Fraction of false reports", margin(zero) size(medlarge))
        xtitle("Scenario", margin(small) size(medlarge))
        title("Mean Absolute Deviation from Bayesian Posterior by Probability Coursework", size(med))
        ymtick(0(1)25, tlwidth(vvthin))
        ytick(0(5)25, tlwidth(vthin))
        ylabel(0(5)25)
        xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
        legend(order(1 2) label(1 "Full Info") label(2 "No Info"))
        graphregion(color(white) margin(zero))
        plotregion(margin(medsmall))
        text(`prior_pos' 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
        text(`prior_pos' 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
        ;
      #delimit cr

      graph export $projdir/out/fig/update/mean_abs_dist_by_prior_treat.pdf, replace as(pdf)
      graph export "$overleafdir/figures/update/mean_abs_dist_by_prior_treat.pdf", replace as(pdf)


  //------------------------------------------------------------------------
  // correct direction of updates by prior and probability course
  //------------------------------------------------------------------------

  restore, preserve


  collapse (mean) catvar pct_update_dir_correct = update_dir_correct ///
    mean_bayes_revision = bayes_revision ///
    mean_actual_revision = actual_revision ///
    (count) n = bayes_revision, by(prior probability_course)


    #delimit ;
    graph twoway
      (scatter pct_update_dir_correct catvar if probability_course==1, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(midblue))
      (scatter pct_update_dir_correct catvar if probability_course==0, connect(direct)
      msize(small)  lpattern(solid) color(black))
      ,
      ytitle("Fraction of false reports", margin(zero) size(medlarge))
      xtitle("Scenario", margin(small) size(medlarge))
      title("Fraction of Correct Direction Updates by Probability Coursework", size(med))
      ymtick(0(.01)1, tlwidth(vthin))
      ytick(0(.05)1, tlwidth(vthin))
      ylabel(0(0.1)1)
      xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
      legend(stack order(1 2) label(1 "Took Probaility Course") label(2 "Didn't Take Probability Course"))
      graphregion(color(white) margin(zero))
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

    graph export $projdir/out/fig/update/update_dir_correct_by_prior_prob_course.pdf, replace as(pdf)
    graph export "$overleafdir/figures/update/update_dir_correct_by_prior_prob_course.pdf", replace as(pdf)






//------------------------------------------------------------------------
// mean distance bewteen update and bayesian by prior and ball color
//------------------------------------------------------------------------

restore, preserve


collapse (mean) catvar mean_belief2_dist = belief2_dist ///
  mean_bayes_revision = bayes_revision ///
  mean_actual_revision = actual_revision ///
  (count) n = bayes_revision, by(prior ball1 full_info)

local prior_pos -25

// scatter plot for full info by ball color
  #delimit ;
  graph twoway
    (scatter mean_belief2_dist catvar if ball1=="red" & full_info==1, connect(direct) msymbol(T)
    msize(small)  lpattern(solid) color(orange_red))
    (scatter mean_belief2_dist catvar if ball1=="blue" & full_info==1, connect(direct)
    msize(small)  lpattern(solid) color(midblue))
    , aspectratio(1)  ysize(6)  xsize(6)
    yline(0, lcolor(grey) lpattern(dash) lwidth(vthin))
    ytitle("Distance from Bayesian Posterior", margin(zero) size(med))
    xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
    title("Mean Distance to Bayesian Posterior by Prior, Full Info", size(small))
    xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
    ymtick(-25(1)25, tlwidth(vvthin))
    ytick(-25(5)25, tlwidth(vthin))
    ylabel(-25(5)25)
    graphregion(color(white) margin(zero))
    legend(order(1 2) label(1 "Red Ball") label(2 "Blue Ball"))
    plotregion(margin(medsmall))
    text(`prior_pos' 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
    text(`prior_pos' 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
    ;
  #delimit cr

  graph export $projdir/out/fig/update/belief2_dist_by_ball_full_info.pdf, replace as(pdf)
  graph export "$overleafdir/figures//update/belief2_dist_by_ball_full_info.pdf", replace as(pdf)



  // scatter plot for no info by ball color


    #delimit ;
    graph twoway
      (scatter mean_belief2_dist catvar if ball1=="red" & full_info==0, connect(direct) msymbol(T)
      msize(small)  lpattern(solid) color(orange_red))
      (scatter mean_belief2_dist catvar if ball1=="blue" & full_info==0, connect(direct)
      msize(small)  lpattern(solid) color(midblue))
      , aspectratio(1)  ysize(6)  xsize(6)
      yline(0, lcolor(grey) lpattern(dash) lwidth(vthin))
      ytitle("Distance from Bayesian Posterior", margin(zero) size(med))
      xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
      title("Mean Distance to Bayesian Posterior by Prior, No Info", size(small))
      xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
      ymtick(-25(1)25, tlwidth(vvthin))
      ytick(-25(5)25, tlwidth(vthin))
      ylabel(-25(5)25)
      graphregion(color(white) margin(zero))
      legend(order(1 2) label(1 "Red Ball") label(2 "Blue Ball"))
      plotregion(margin(medsmall))
      text(`prior_pos' 1 "0.1", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 2 "0.2", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 3 "0.3", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 4 "0.4", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 5 "0.5", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 6 "0.6", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 7 "0.7", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 8 "0.8", placement(n) orientation(horizontal) color(black) size(small))
      text(`prior_pos' 9 "0.9", placement(n) orientation(horizontal) color(black) size(small))
      ;
    #delimit cr

    graph export $projdir/out/fig/update/belief2_dist_by_ball_no_info.pdf, replace as(pdf)
    graph export "$overleafdir/figures//update/belief2_dist_by_ball_no_info.pdf", replace as(pdf)














log close
translate $projdir/log/post_figures.smcl ///
  $projdir/log/post_figures.log, replace
