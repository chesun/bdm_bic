//# Belief Elicitation and Behavioral Incentive Compatibility
//-----------------------------------------------------------------------
//## STATA Code

//Initialize environment

set linesize 250
set more off
cd ".." // Set base directory
//-----------------------------------------------------------------------
//#### Generate core variables for BSR study
//-----------------------------------------------------------------------
qui{
    use data/data-bsr-qsr.dta, clear
    export delimited using "data/data-bsr-qsr.csv", nolabel replace //export csv for Mathematica file
    // Create indicator for false report
    generate false = (belief1 != pur)
    label define lab_false 0 "True-report" 1 "False-report"
    label values false lab_false
    
    // Create indicator for centered prior:
    generate center = (pur==50)
    label define lab_center 0 "Non-Centered" 1 "Centred"
    label values center lab_center
    
    // Define false report types (to-center, to-nearest-extreme, to-distant-extreme)
    generate f_cent = ((pur < belief1 & belief1 <= 50) | (pur > belief1 & belief1 >= 50))
    generate f_extr = ((pur < 50 & belief1 < pur) | (pur > 50 & belief1 > pur))
    generate f_dist = ((pur < 50 & 50 < belief1)  | (pur > 50 & 50 > belief1) )
    generate false_type = 0
    replace false_type = 1 if false & f_cent
    replace false_type = 2 if false & f_extr
    replace false_type = 3 if false & f_dist
    label define lab_false_type 0 "True-report" 1 "Center" 2 "Near-extreme" 3 "Far-extreme"
    label values false_type lab_false_type 
    

    // Create treatment categories for Table 2 
    generate t_cats = .
    replace t_cats = 10 if treatment ==  1                // Information 
    replace t_cats = 20 if treatment == 2                // RCL
    replace t_cats = 30 if treatment == 3                // No-Information 
    replace t_cats = 41 if treatment == 4 & period <= 2  // Feedback (t=1,2)
    replace t_cats = 49 if treatment == 4 & period >= 9  // Feedback (t=9,10)
    replace t_cats = 50 if treatment == 5                // Description
   
    label define lab_t_cats 10 "Information" 20 "RCL" 30 "No-Information" 41 "Feedback (t=1,2)" 49 "Feedback (t=9,10)" 50 "Description"
    label values t_cats lab_t_cats
    
    local TreatmentList 10 20 30 41 49 50
    local ComparisonTreatmentList  20 30 41 49 50 // excluding Information
    // Generate Subject specific rate of prior false reports
    bysort subjectid: egen all_correct = sum(false)
    replace all_correct = (all_correct==0)
    replace all_correct = . if period > 1
    sort id
}


//We then keep this core data set in memory as we move through each analysis via `preserve` and `restore` commands

//-----------------------------------------------------------------------
//##Introduction 
//#### Table 1
//This table is constructed from theory which can be reproduced with:

di "Submit" _column(9) "Chance Red" _column(18) "Chance Blue"
foreach pRed in 1 0.9 0.8 0.7 0.6 0.5 {
 local ChanceRed=round(100*(1-(1-`pRed')^2))
 local ChanceBlue=round(100*(1-(`pRed')^2))
 di "`pRed'"  _column(9)  "`ChanceRed'%"   _column(18)  "`ChanceBlue'%"
}

//-----------------------------------------------------------------------
//### Section 2.2: Information Treatment Results
//-----------------------------------------------------------------------
qui{
    preserve
    // Select Information treatment of BSR data
    keep if scoring == 1 & treatment == 1
    sum false
    noi di"********************************************************"
    noi di"Overall false-report rate: " %4.1f r(mean)*100 "%"
    noi di"********************************************************"

    probit false period, cluster(subjectid)
    test period
    noi di"********************************************************"
    noi di"Test of time trend: p = " %4.3f r(p)
    noi di"********************************************************"

    noi di"********************************************************"
    noi di"Share of participants with 10/10 correct reports"
    noi tab all_correct
    noi di"********************************************************"

    noi di"********************************************************"
    noi di"False-report rates by prior type"
    sum false if pur!=50
    noi di" - non-centered: " %4.1f r(mean)*100 "%"
    sum false if pur==50
    noi di" - centered:     " %4.1f r(mean)*100 "%"
    probit false center, cluster(subjectid)
    test center
    noi di" - p =           " %4.3f r(p)
    noi di"********************************************************"

    generate double adist1 = abs(belief1 - post1)
    sum adist1 if false == 1
    noi di"********************************************************"
    noi di"Average deviation if false: " %4.3f r(mean)/100
    noi di"********************************************************"

    generate false_5 = (abs(belief1 - post1) > 5)
    noi di"********************************************************"
    noi di"Footnote 16: False-report rates (> +/-5pp) by prior type"
    sum false_5 if pur!=50
    noi di" - non-centered: " %4.1f r(mean)*100 "%"
    sum false_5 if pur==50
    noi di" - centered:     " %4.1f r(mean)*100 "%"
    probit false_5 center, cluster(subjectid)
    test center
    noi di" - p =           " %4.3f r(p)
    noi di"********************************************************"

    noi di"********************************************************"
    noi di"Types of false reports"
    sum f_cent if false == 1 & center == 0
    noi di" - to center:          " %6.1f r(mean)*100 "%"
    sum f_extr if false == 1 & center == 0
    noi di" - to nearest extreme: " %6.1f r(mean)*100 "%"
    sum f_dist if false == 1 & center == 0
    noi di" - to distant extreme: " %6.1f r(mean)*100 "%"
    regress f_cent if false == 1 & center == 0 & f_dist == 0, cluster(subjectid)
    test _cons == 0.5
    noi di" - center vs. nearest extreme (OLS):    p = " %4.3f r(p)
    noi di"********************************************************"
    restore
}
//-----------------------------------------------------------------------
//#### Figure 2 Panel A
//-----------------------------------------------------------------------
qui{
    preserve
    // Select prior reports from BSR Information treatment:
    keep if scoring == 1 & treatment == 1
    keep id treatment subjectid period false
    // Get period averages and confidence intervals:
    collapse (mean)  meanb=false (sd) sdb=false (count) n=false, by(period)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))

    // Print figure:
    #delimit ;
    graph twoway 
        scatter meanb period, connect(direct) msymbol(T)  msize(small) lpattern(solid) color(black)
    || 	rcap hib lob period, lcolor(black) msize(small) lwidth(vthin)
        ,
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Period", margin(small) size(medlarge)) 
        xlabel(#10, labsize(medlarge) tlwidth(vthin) nogrid )
        ylabel(0(.1)1, labsize(medlarge) glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f))	
        ymtick(0(.01)1, tlwidth(vthin))
        ytick(0(.05)1, tlwidth(vthin))
        legend(off)
        graphregion(color(white) margin(zero))
        plotregion(margin(medsmall))
        ;
    #delimit cr
    qui graph export figures/pdf/figure2_A.pdf, replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
//#### Figure 2 Panel B
//-----------------------------------------------------------------------
qui{
    preserve
    // Select prior reports from BSR Information treatment:
    keep if scoring == 1 & treatment == 1
    keep id treatment subjectid period pur false 
    // Get averages per subject and prior:
    collapse treatment false, by (subjectid pur)
    // Generate consecutive numbers on x-axis for each prior:
    generate catvar = .
    local val = 0
    levelsof pur, local(levelsofvar)
    foreach p of local levelsofvar {
        local val = `val'+1
        replace catvar = `val' +  0 if pur == `p'
    }
    // Get averages per prior and confidence intervals:
    collapse (mean) catvar meanb=false (sd) sdb=false (count) n=false, by(treatment pur)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    #delimit ;
        graph twoway
        (bar meanb catvar, lwidth(0.1) lcolor(white) fcolor(gs5))
    || (rcap hib lob catvar, lcolor(black) msize(small) lwidth(vthin)),
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
        xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
        ytick(0(.05)1)
        ymtick(0(.01)1)
        ylabel(0(0.1)1,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
        graphregion(color(white) margin(zero))
        legend(off)
        plotregion(margin(medsmall))
        text(0.02 1 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 2 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 3 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 4 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 5 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge))
        ;
    #delimit cr
    graph export figures/pdf/Figure2_B.pdf, replace as(pdf)
    restore
}


//-----------------------------------------------------------------------
//#### #### Table 2
//-----------------------------------------------------------------------
qui{
    preserve
    // Select BSR data
    keep if scoring == 1
    // Column 1 Overall rates
    noi di  "********************************************************" 
    noi di "All data:  (Column 1)"
    noi prop i(1).false if t_cats!=., over(t_cats) vce(cluster subjectid) cformat(%4.3f)
    noi di  "********************************************************" 
    noi di "Comparisons to Information:" 
    foreach treat of numlist `ComparisonTreatmentList' {
         //Look at difference relative to Information
         lincom 1.false@10.t_cats-1.false@`treat'.t_cats
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    noi di  "********************************************************"
    noi di "Non-Centered/Centered  (Columns 3 and 2)"
    // Columns 2/3 (if symmetric or asymmetric prior location)
    noi prop i(1).false if t_cats!=., over(center t_cats) vce(cluster subjectid) cformat(%4.3f)
    foreach ctype of numlist 0/1 {
        noi di  "********************************************************" 
        noi di "Comparisons to Information: (`: label (center) `ctype'' priors)"
        foreach treat of numlist `ComparisonTreatmentList'  {
             //Look at difference relative to Information
             lincom 1.false@`ctype'.center#10.t_cats-1.false@`ctype'.center#`treat'.t_cats
             noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
        }
    }
    foreach movement of numlist 1/3 {
        noi di  "********************************************************"
        noi di "False-reports to `: label (false_type) `movement''"
        noi prop i(`movement').false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid) cformat(%4.3f)
        noi di  "********************************************************"
        noi di "Comparisons to Information:"
        foreach treat of numlist `ComparisonTreatmentList' {
             //Look at difference relative to Information
             lincom `movement'.false_type@10.t_cats-`movement'.false_type@`treat'.t_cats
             noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
        }
    }
    // Columns 4 To Center
    noi prop i(1).false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid) cformat(%4.3f)
    // Columns 5 To Near Extreme
    noi prop i(2).false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid) cformat(%4.3f)
    // Columns 6 TO Far Extreme
    noi prop i(3).false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid) cformat(%4.3f)  
    restore
}


//-----------------------------------------------------------------------
//Footnote 27: parallel estimation via Probit instead of LPM
//-----------------------------------------------------------------------
qui{
    preserve
    // Select BSR data
    keep if scoring == 1
    // Column 1 Overall rates
    probit  false i.t_cats, vce(cluster subjectid) cformat(%4.3f)
    noi margins t_cats
    gen asym=center==0
    probit  false t_cats##i.asym, vce(cluster subjectid) cformat(%4.3f)
    noi margins t_cats, at(asym=0)
    noi margins t_cats, at(asym=1)
    restore
}

//-----------------------------------------------------------------------
// ### Section 2.4: RCL & No-Information Results
// Table 2 entries and in-text figures/tests
//-----------------------------------------------------------------------
qui{
    preserve
    noi di "********************************************************"
    noi di "Footnote 24"
    qui keep if scoring == 1
    qui generate double adist1 = abs(belief1 - post1)/100
    qui levelsof treatment, local(levels)
    foreach l of local levels {
        qui sum adist1 if false == 1 & treatment == `l'
        qui local treat_label "`: label (treat) `l''"
        noi di " - `treat_label': " %4.3f  r(mean)
    }
    noi di "********************************************************"
    restore
    preserve
    use data/data-HoltSmith2016.dta, clear
    noi di "********************************************************"
    noi di "Footnote 25: False-report rates in Holt and Smith (2016)"
    levelsof treat, local(levels)
    foreach l of local levels {
        count if treat == `l' & nodraws == 1
        global n =r(N)
        count if treat == `l' & nodraws == 1 & actualprediction != bayesprediction 
        local treat_label "`: label (treat) `l''"
        noi di " - Treatment `treat_label': " %6.0f  r(N)/$n*100 "%"
    }
    noi di "********************************************************"
    restore
    
    preserve
    // Select BSR data
    keep if scoring == 1

    noi di "********************************************************"
    noi di "*** Information (base):"
    // Column 2-3 of Table 2 ("By Prior")
    prop false if t_cats!=., over(center t_cats) vce(cluster subjectid)
    test _b[1.false@1.center#10.t_cats]  == _b[1.false@0.center#10.t_cats] 
    noi di "Information center vs no-center: p = " %4.3f r(p)
    
    // Column 4-6 of Table 2 ("False-Report Type")
    prop false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid)
    test _b[1.false_type@10.t_cats]  == _b[2.false_type@10.t_cats] 
    di "Information to-center vs to-near-extreme: p = " %4.3f r(p)
    noi di "*** RCL:"
    // Column 1 of Table 2 ("All Priors")
    prop false if t_cats!=., over(t_cats) vce(cluster subjectid)
    test _b[1.false@10.t_cats]  == _b[1.false@20.t_cats] 
    noi di "RCL vs Information: p = " %4.3f r(p)

    // Column 2-3 of Table 2 ("By Prior")
    prop false if t_cats!=., over(center t_cats) vce(cluster subjectid)
    test _b[1.false@0.center#10.t_cats]  == _b[1.false@0.center#20.t_cats] 
    noi di "RCL vs Information | non-centered: p = " %4.3f r(p)
    test _b[1.false@1.center#20.t_cats]  == _b[1.false@0.center#20.t_cats] 
    noi di "RCL center vs no-center: p = " %4.3f r(p)

    noi di "********************************************************"
    noi di "*** Footnote 30:"
    // Column 4-6 of Table 2 ("False-Report Type")
    prop false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid)
    test _b[1.false_type@20.t_cats]  == _b[2.false_type@20.t_cats] 
    noi di " - RCL to-center vs to-near-extreme: p = " %4.3f r(p)
    test _b[2.false_type@10.t_cats]  == _b[2.false_type@20.t_cats] 
    noi di " - To-near-extreme, Information vs RCL: p = " %4.3f r(p)
    test _b[1.false_type@10.t_cats]  == _b[1.false_type@20.t_cats] 
    noi di " - To-center, Information vs RCL: p = " %4.3f r(p)


    // Column 1 of Table 2 ("All Priors")
    noi di "*** No Information:"
    prop false if t_cats!=., over(t_cats) vce(cluster subjectid)
    test _b[1.false@30.t_cats]  == _b[1.false@10.t_cats] 
    
    noi di "No-Information vs Information: p = " %4.3f r(p)
    test _b[1.false@30.t_cats]  == _b[1.false@20.t_cats] 
    noi di "No-Information vs RCL: p = " %4.3f r(p)

    generate last_two = (period >= 9)
    regress false last_two if treatment == 3 & (period <= 2 | period >= 9), cluster(subjectid)
    test last_two
    noi di "********************************************************"
    noi di "Footnote 31: No-Information (t=1,2) vs (t=9,10): b = " %4.3f _b[last_two] " | p = " %4.3f r(p) 

    // Column 2-3 of Table 2 ("By Prior")
    prop false if t_cats!=., over(center t_cats) vce(cluster subjectid)
    test _b[1.false@1.center#30.t_cats]  == _b[1.false@0.center#30.t_cats] 
    noi di "No-Information center vs no-center: p = " %4.3f r(p)

    // Column 4-6 of Table 2 ("False-Report Type")
    prop false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid)
    test _b[1.false_type@30.t_cats]  == _b[2.false_type@30.t_cats] 
    noi di "No-Information to-center vs to-near-extreme: p = " %4.3f r(p)

    noi di "********************************************************"
    di "Footnote 32:"
    // Column 4-6 of Table 2 ("False-Report Type")
    prop false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid)
    test _b[1.false_type@10.t_cats]  == _b[1.false_type@30.t_cats] 
    di " - To-center, Information vs No-Information: " %4.3f _b[1.false_type@10.t_cats] " | " %4.3f _b[1.false_type@30.t_cats] " | p = " %4.3f r(p)
    test _b[2.false_type@10.t_cats]  == _b[2.false_type@30.t_cats] 
    di " - To-near-extreme, Information vs No-Information: " %4.3f _b[2.false_type@10.t_cats] " | " %4.3f _b[2.false_type@30.t_cats] " | p = " %4.3f r(p)

    noi di "********************************************************"
    noi di "Footnote 33"
    // Column 2-3 of Table 2 ("By Prior")
    prop false if t_cats!=., over(center t_cats) vce(cluster subjectid)
    test _b[1.false@1.center#20.t_cats]  == _b[1.false@0.center#20.t_cats] 
    noi di " - RCL center vs no-center: p = " %4.3f r(p)
    // Column 4-6 of Table 2 ("False-Report Type")
    prop false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid)
    test _b[1.false_type@20.t_cats]  == _b[1.false_type@30.t_cats] 
    noi di " - To-center, RCL vs No-Information: p = " %4.3f r(p)
    noi di "********************************************************"
    restore
}
//-----------------------------------------------------------------------
// Tests for mechanism comprehension from surveys:
//-----------------------------------------------------------------------

qui{ 
    preserve
    noi di "********************************************************"
    di "Footnote 34"
    // Select BSR data
    keep if scoring == 1 & (treat == 1 | treat == 2 | treat == 3)

    // Get variable labels
    local lab1: variable label agree1
    local lab2: variable label agree2
    local lab3: variable label agree3

    // Binarize response scale to agree/not agree
    generate understd_pay_calc = (agree1>3)
    generate belief_affect_pay = (agree2>3)
    generate always_most_accur = (agree3>3)

    // Test for independence
    collapse treat understd_pay_calc belief_affect_pay always_most_accur, by(subjectid)
    label var understd_pay_calc "`lab1'"
    label var belief_affect_pay "`lab2'"
    label var always_most_accur "`lab3'"
    label values treat ltreatment

    noi di "  " `""`lab3'""'
    sum always_most_accur if treat == 1
    noi di "   - Information:    " %2.0f r(mean)*100 "%"
    sum always_most_accur if treat == 3
    noi di "   - No-Information: " %2.0f r(mean)*100 "%"
    sum always_most_accur if treat == 2
    noi di "   - RCL:            " %2.0f r(mean)*100 "%"
    tab treat always_most_accur if (treat == 1 | treat == 3), row chi2 nokey
    noi di "   - No-Information vs Information: p = " %4.3f r(p)
    tab treat always_most_accur if (treat == 1 | treat == 2), row chi2 nokey
    noi di "   - RCL vs Information:            p = " %4.3f r(p)

    noi di "********************************************************"
    di "  Comprehension of mechansim"
    // RCL versus Information
    noi di "   - RCL vs Information"
    tab treat understd_pay_calc if (treat == 1 | treat == 2), row chi2 nokey
    noi di "     p = " %4.3f r(p) " (understand)"
    tab treat belief_affect_pay if (treat == 1 | treat == 2), row chi2 nokey
    noi di "     p = " %4.3f r(p) " (affect pay)"

    // No-Information versus RCL + Information (pooled)
    noi di "   - No-Information vs RCL + Information (pooled)"
    generate no_info = (treat == 3)
    tab no_info understd_pay_calc, row chi2 nokey
    noi di "     p = " %4.3f r(p) " (understand)"
    tab no_info belief_affect_pay, row chi2 nokey
    noi di "     p = " %4.3f r(p) " (affect pay)"
    noi di "********************************************************"
    noi di "  " `""`lab1'""'
    sum understd_pay_calc if treat == 1
    noi di "   - Information:    " %2.0f r(mean)*100 "%"
    sum understd_pay_calc if treat == 2
    noi di "   - RCL:            " %2.0f r(mean)*100 "%"
    sum understd_pay_calc if treat == 3
    noi di "   - No-Information: " %2.0f r(mean)*100 "%"
    noi di "********************************************************"
    noi di "  " `""`lab2'""'
    sum belief_affect_pay if treat == 1
    noi di "   - Information:    " %2.0f r(mean)*100 "%"
    sum belief_affect_pay if treat == 2
    noi di "   - RCL:            " %2.0f r(mean)*100 "%"
    sum belief_affect_pay if treat == 3
    noi di "   - No-Information: " %2.0f r(mean)*100 "%"
    noi di "********************************************************"
    restore
}
//-----------------------------------------------------------------------
qui{
    // For decomposition
    preserve
    // Select BSR data
    keep if scoring == 1 & (treat == 1 | treat == 2 | treat == 3)

    noi di "********************************************************"
    noi di "False reports at non-centered priors"
    sum false if !center & treat == 1
    noi di " - Information:    " %2.1f r(mean)*100 "%"
    sum false if !center & treat == 2
    noi di " - RCL:            " %2.1f r(mean)*100 "%"
    sum false if !center & treat == 3
    noi di " - No-Information: " %2.1f r(mean)*100 "%"
    noi di "********************************************************"
    restore
}
//-----------------------------------------------------------------------
// ### Figure 4 "False-report rate in No-Information and RCL treatments"
// Figure 4A: Across Session
//-----------------------------------------------------------------------
quietly {
    // ::: FIGURE 4.A
    preserve
    // Select prior reports from BSR data:
    keep if scoring == 1
    keep id treatment subjectid period false
    // Get period averages in each treatment:
    collapse false, by(treat period)
    // Print figure:
    #delimit ;
    graph twoway 
        scatter false period if treat == 3, connect(direct) msymbol(Oh) msize(medsmall) lpattern(shortdash) color(black)
    ||	scatter false period if treat == 1, connect(direct) msymbol(T) msize(medsmall) lpattern(solid) color("gs12")
    ||	scatter false period if treat == 2, connect(direct) msymbol(D) msize(medsmall) lpattern(solid) color(black) 
        ,
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Period", margin(small) size(medlarge)) 
        xlabel(#10, labsize(medlarge) tlwidth(vthin) nogrid )
        ylabel(0(.1).6,  labsize(medlarge) glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f))	
        ymtick(0(.01).6, tlwidth(vthin))
        ytick(0(.05).6, tlwidth(vthin))
        graphregion(color("255 255 255") margin(zero))
        legend( col(1) lab(1 "No Information") lab(2 "Information") lab(3 "RCL Calculator") 
        region(fcolor(white) lwidth(vthin) ) size(medlarge) position(0) bplacement("sw") order(2 1 3) )
        graphregion(color(white) margin(small))
        plotregion(margin(small))
        name($filename, replace)
        ;
    #delimit cr
    graph export figures/pdf/figure_4_A.pdf, replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
// Figure 4B: By prior
//-----------------------------------------------------------------------
qui{
    preserve
    // Select prior reports from BSR data:
    keep if scoring == 1
    keep id treatment subjectid period pur false
    // Get averages per subject and prior:
    collapse treatment false, by(subjectid pur)
    // Generate consecutive numbers on x-axis for each prior and treatment:
    generate catvar = .
    local val = 0
    levelsof pur, local(levelsofvar)
    foreach p of local levelsofvar {
        local val = `val'+1
        replace catvar = `val' +  0 if pur == `p' & treat == 1
        replace catvar = `val' +  6 if pur == `p' & treat == 2
        replace catvar = `val' + 12 if pur == `p' & treat == 3
    }
    // Get averages per prior in each treatment and confidence intervals:
    collapse (mean) catvar meanb=false (sd) sdb=false (count) n=false, by(treatment pur)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    #delimit ;
        graph twoway
        (bar meanb catvar, lwidth(0.1) lcolor(white) fcolor(gs5))
    || (rcap hib lob catvar, lcolor(black) msize(small) lwidth(vthin)),
        aspectratio(1)
        ysize(5) 
        xsize(5)			
        ytitle("Fraction of false prior reports", margin(zero) size(medlarge)) 
        xtitle("Known prior of Red Urn", margin(small) size(medlarge))
        xlabel(2.5 " " , noticks labsize(medlarge))
        ytick(0(0.05)0.8)
        ymtick(0(.01)0.8)
        ylabel(0(0.1)0.8, glwidth(0.1) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
        graphregion(color("255 255 255") margin(zero))
        legend(off)
        plotregion( m(b=0) )
        text(0.02  1 ".2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  2 ".3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  3 ".5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  4 ".7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  5 ".8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  7 ".2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  8 ".3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  9 ".5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 10 ".7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 11 ".8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 13 ".2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 14 ".3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 15 ".5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 16 ".7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 17 ".8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(-0.045 3 "Information",     placement(n) orientation(horizontal) color(black) size(medlarge)) 
        text(-0.045 9 "RCL Calculator",  placement(n) orientation(horizontal) color(black) size(medlarge)) 
        text(-0.045 15 "No Information", placement(n) orientation(horizontal) color(black) size(medlarge)) 
        ;
    #delimit cr
    graph export figures/pdf/figure_4_B.pdf, replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
// ### Section 3: Feedback Treatment
// Table 2 entries and in-text figures/tests
//-----------------------------------------------------------------------

qui{
    preserve
    // Select BSR data
    keep if scoring == 1
    noi di "********************************************************"
    // Column 1 of Table 2 ("All Priors")
    prop false if t_cats!=., over(t_cats) vce(cluster subjectid)
    test _b[1.false@41.t_cats]  == _b[1.false@49.t_cats] 
    noi di "Feedback (t=1,2) vs (t=9,10): " %4.3f _b[1.false@41.t_cats] " | " %4.3f _b[1.false@49.t_cats] " | p = " %4.3f r(p)
    test _b[1.false@41.t_cats]  == _b[1.false@30.t_cats] 
    noi di "Feedback (t=1,2) vs No-Information:  p = " %4.3f r(p)
    test _b[1.false@41.t_cats]  == _b[1.false@10.t_cats] 
    noi di "Feedback (t=1,2) vs Information:     p = " %4.3f r(p)
    test _b[1.false@49.t_cats]  == _b[1.false@30.t_cats] 
    noi di "Feedback (t=9,10) vs No-Information: p = " %4.3f r(p)
    test _b[1.false@49.t_cats]  == _b[1.false@10.t_cats] 
    noi di "Feedback (t=9,10) vs Information:    p = " %4.3f r(p)
    noi di "********************************************************"
    di "Footnote 35: Time trends"
    levelsof treat, local(levels)
    foreach l of local levels {
        regress false period if treat == `l', cluster(subjectid)
        test period
        local treat_label "`: label (treat) `l''"
        noi di " - `treat_label': _b[period] = "  %4.3f _b[period] " | p = " %4.3f  r(p)
    }
    noi di "********************************************************"
    // Column 2-3 of Table 2 ("By Prior")
    prop false if t_cats!=., over(center t_cats) vce(cluster subjectid)
    test _b[1.false@1.center#49.t_cats]  == _b[1.false@0.center#49.t_cats] 
    noi di "Feedback (t=9,10), center vs no-center: "  %4.3f _b[1.false@1.center#49.t_cats] " | " %4.3f _b[1.false@0.center#49.t_cats]  " | p = " %4.3f r(p)

    noi di "********************************************************"
    noi di "Footnote 36"
    generate fb_last_3 = .
    replace fb_last_3 = 1 if treatment == 4 & period >= 8  // Feedback (t=9,10)
    prop false if fb_last_3!=., over(center fb_last_3) vce(cluster subjectid)
    test _b[1.false@1.center#1.fb_last_3]  == _b[1.false@0.center#1.fb_last_3] 
    noi di " - Feedback (t=8,9,10), center vs no-center: "  %4.3f _b[1.false@1.center#1.fb_last_3] " | " %4.3f _b[1.false@0.center#1.fb_last_3]  " | p = " %4.3f r(p)
    noi di "********************************************************"
    restore
}

//-----------------------------------------------------------------------
// #### Figure 6:  False-report rate in Feedback treatment
//-----------------------------------------------------------------------
quietly {
    // ::: FIGURE 6.A
    preserve
    // Select prior reports from BSR data:
    keep if scoring == 1
    keep id treatment subjectid period false
    // Get period averages per treatment:
    collapse false, by(treat period)
    #delimit ;
    graph twoway 
        scatter false period if treat == 1, connect(direct) msymbol(T)  msize(medsmall) lpattern(solid)     color(gs12)
    || scatter false period if treat == 3, connect(direct) msymbol(Oh) msize(medsmall) lpattern(shortdash) color(gs12)
    || scatter false period if treat == 4, connect(direct) msymbol(Oh) msize(medsmall) lpattern(solid)     color(black)
        ,
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Period", margin(small) size(medlarge)) 
        xlabel(#10, labsize(medlarge) tlwidth(vthin) nogrid )
        ylabel(0(.1)0.6,  labsize(medlarge) glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f))	
        ymtick(0(.01)0.6, tlwidth(vthin))
        ytick(0(.05)0.6, tlwidth(vthin))
        graphregion(color("255 255 255") margin(zero))
        legend( rows(3) colfirst lab(2 "No Information") lab(3 "Feedback")  lab(1 "Information") 
        region(fcolor(white) lwidth(vthin) )  size(medlarge)  position(0) bplacement(sw) order(1 2 3)  )
        graphregion(color(white) margin(small))
        plotregion(margin(small))
        ;
    #delimit cr
    graph export figures/pdf/figure_6_A.pdf, replace as(pdf)
    restore
}
//-----------------------------------------------------------------------
qui{
    // ::: FIGURE 6.B
    preserve
    // Select prior reports from BSR Feedback treatment:
    keep if scoring == 1 & treat == 4
    keep id treatment subjectid period pur false
    // Generate indicator for last two periods versus first two periods:
    generate double half2 = .
    replace half2 = 0 if period <= 2
    replace half2 = 1 if period >= 9
    // Get averages per subject, prior, and first/last two periods:
    collapse false, by(subjectid pur half2)
    // Generate consecutive numbers on x-axis for each prior and first/last two periods:
    generate catvar = .
    local val = 0
    levelsof pur, local(levelsofvar)
    foreach p of local levelsofvar {
        local val = `val'+1
        replace catvar = `val' +  0 if pur == `p' & half2 == 0
        replace catvar = `val' +  6 if pur == `p' & half2 == 1
    }
    // Get averages per prior and first/last two periods:
    collapse (mean) catvar meanb=false, by(pur half2)
    #delimit ;
    graph twoway (bar meanb catvar, lwidth(0.1) lcolor(white) fcolor(gs5)),
        aspectratio(1)
        ysize(5) 
        xsize(5)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Known prior of Red Urn", margin(small) size(medlarge))
        xlabel(2.5 " " , noticks labsize(medlarge))
        ytick(0(0.05)0.8)
        ymtick(0(.01)0.8)
        ylabel(0(0.1)0.8,  glwidth(0.1) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
        graphregion(color("255 255 255") margin(zero))
        legend(off)
        plotregion( m(b=0) )
        text(0.02  1 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  2 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  3 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  4 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  5 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  7 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  8 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  9 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 10 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 11 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(-0.05 3 "Period 1&2",  placement(n) orientation(horizontal) color(black) size(medlarge)) 
        text(-0.05 9 "Period 9&10", placement(n) orientation(horizontal) color(black) size(medlarge)) 
        ;
    #delimit cr
    graph export figures/pdf/figure_6_B.pdf, replace as(pdf)
    restore
} 
//-----------------------------------------------------------------------
// ### Section 4: Posterior Reports
// * Figure 7 is included in the Mathematica replication file
// * See Below for in-text figure derived from Online Appendix Table A.2 and Footnote 41
//-----------------------------------------------------------------------
quietly {
    preserve
    // Select BSR data
    keep if scoring == 1 
    noi di "********************************************************"
    keep id treatment subjectid period belief* post* 
    reshape long belief post, i(id) j(guess)
    drop if guess == 1

    generate false = (belief == post)
    sum false if post > 0 & post < 100
    noi di "Correct reports of non-boundary Bayesian posteriors: " %4.1f r(mean)*100 "%"
    noi di "********************************************************"
    noi di "Footnote 39"
    sum false if post == 0 | post == 100
    noi di " - Correct reports of boundary Bayesian posteriors: " %4.1f r(mean)*100 "%"

    generate double distant = abs(belief - post) >= 15

    noi di "********************************************************"
    noi di "Distant posterior reports"
    levelsof treat, local(levels)
    foreach l of local levels {
        sum distant if treat == `l'
        local treat_label "`: label (treat) `l''"
        noi di " - `treat_label': " %4.0f  r(mean)*100 "%"
    }
    noi di "********************************************************"
    restore
    preserve
    noi di "*Footnote 42: Signed-Rank Test"
    keep if scoringrule==1
    * reshape to long data
    reshape long belief post, i(id) j(guess)
    * get rid of the prior data
    keep if guess>1
    *crete elicitation scenario ID
    egen group_scen=group(scenario_order scenarioid guess)
    * Obtain the quartiles by elicitaiton scenario
    collapse (p25) belief25=belief (p75) belief75=belief (mean) post=post, by(group_scen treatment)
    * Focus only on asymmetric posteriors
    drop if post==50
    * Symmetrize to get center movement
    gen beliefCenter=(post<50)*belief75+(post>50)*(100-belief25)
    gen beliefExtreme=(post>50)*(100-belief75)+(post<50)*belief25
    drop belief25 belief75
    * Get the matched data by treatment
    reshape wide beliefCenter beliefExtreme post, i(group_scen) j(treatment)
    * run Wilcoxon signed-rank-test
    signrank beliefCenter1=beliefCenter3 // Information vs No Information
    noi di "Upper quartile move to Center p = " %4.3f   r(p)
    signrank beliefExtreme1=beliefExtreme4
    noi di "Lower quartile move to Center p = " %4.3f   r(p)
    noi di "********************************************************"
    restore
}
//-----------------------------------------------------------------------
// ### Section 5.1: Impact of center-biased reporting
//-----------------------------------------------------------------------
qui{
    preserve
    // Select BSR data
    keep if scoring == 1 
    noi di "********************************************************"
    noi di "Share of participants consistently reporting back the induced prior"
    noi tab treat all_correct if (treat == 1 | treat == 4), row nokey
    restore
    noi di "********************************************************"
    di "NV-replication results"
    di "Footnote 46: Estimated center bias alpha"
    preserve
    // Select prior reports from BSR Information treatment:
    use data/data-bsr-qsr.dta, clear
    keep if scoring == 1 & treatment == 1
    keep id treatment subjectid period pur belief1
    // Create variable holding the center belief (weighted with (1-alpha))
    generate cent = 50
    // Creat dummy for "more extreme" priors
    generate extreme = (pur == 20 | pur == 80)
    // Run the regression (see also Table_B_1 in "AER-2020-1248_tables.do")
    nl (belief = (1-({alpha_0}+{d_alpha}*extreme))*pur + ({alpha_0}+{d_alpha}*extreme)*cent) if treat == 1, vce(cluster subjectid)
    // Test for equivalence of estimated center bias
    test _b[/d_alpha] == 0
    noi di " - for priors 0.2 and 0.8: " %4.3f _b[/alpha_0] + _b[/d_alpha]
    noi di " - for priors 0.3 and 0.7: " %4.3f _b[/alpha_0] 
    noi di " - p = " %4.3f r(p)
    noi di "********************************************************"
    restore
}

//-----------------------------------------------------------------------
// #### Table 4:  Gender Differences in Confidence and Tournament Entry: NV replication Results
//-----------------------------------------------------------------------
qui{
    noi di "********************************************************"
    noi di "     Table output: "
    preserve
    use data/data-nv.dta, clear
    export delimited using "data/data-nv.csv", nolabel replace //export csv for Mathematica file
    // Get difference in Tournament and Piece-rate performance
    generate double change = score2-score1
    // Relabel variables for output
    label var female "Female"
    label var score2 "Tournament"
    label var change "Tournament-Piece rate"
    // Change beliefs from percent to probability:
    replace b_to_1 = b_to_1/100
    // Belief is dependent variable (columns 1-2)
    // ----------------------------------------
    // Run regressions:
    eststo clear
    // OLS for No-Information treatment (column 1):
    regress b_to_1 female score2 change if info == 0, cformat(%6.3f) 
    eststo
    // OLS for No-Information treatment (column 2):
    regress b_to_1 female score2 change if info == 1, cformat(%6.3f) 
    eststo
    // Belief is independent variable (columns 3-6)
    // ----------------------------------------
    // Get averages of all independent variables over all treatments to have the same point of comparison for marginal effects:
    sum score2
    global m_score2 = r(mean)
    sum change
    global m_change = r(mean)
    sum b_to_1
    global m_b_to_1 = r(mean)
    // Run regressions:
    // Average marginal effects for No-Information treatment, w/o control for beliefs (column 3):
    probit choice female score2 change        if info == 0
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change) post cformat(%6.3f) 
    eststo
    // Average marginal effects for No-Information treatment, w/ control for beliefs (column 4):
    probit choice female score2 change b_to_1 if info == 0
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
    eststo
    // Average marginal effects for Information treatment, w/o control for beliefs (column 5):
    probit choice female score2 change        if info == 1
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change) post cformat(%6.3f) 
    eststo
    // Average marginal effects for Information treatment, w/ control for beliefs (column 6):
    probit choice female score2 change b_to_1 if info == 1
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
    eststo
    // Print the table
    #delimit ;
        noisily estout, style(fixed) cells(b( fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        stats(N r2, labels("N" "R2") fmt("0 3"))
        label legend
        ;
    #delimit cr

    noi di
    noi di "Tablenote: Columns (1) and (2) with tobit regressions"
    eststo clear
    tobit b_to_1 female score2 change if info == 0, cformat(%6.3f) ll(0) ul(1)
    eststo
    tobit b_to_1 female score2 change if info == 1, cformat(%6.3f) ll(0) ul(1)
    eststo
    #delimit ;
        // noisily estout, style(fixed) cells(b( fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        noisily estout, style(fixed) cells(b(star fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        starlevels(* 0.1 ** 0.05 *** 0.01)
        stats(N r2, labels("N" "R2") fmt("0 3"))
        label legend
        ;
    #delimit cr
    noi di "********************************************************"
    restore
}

//-----------------------------------------------------------------------
// #### Tests in the Text
//-----------------------------------------------------------------------
qui{
    noi di "********************************************************"
    noi di "Tests of gender effect (Table 4, columns 1-2)"
    preserve

    // Open NV-replication data
    use data/data-nv, clear
    // Get difference in Tournament and Piece-rate performance
    generate double change = score2-score1
    // Relabel variables for output
    label var female "Female"
    label var score2 "Tournament"
    label var change "Tournament-Piece rate"
    // Change beliefs from percent to probability:
    replace b_to_1 = b_to_1/100
    // OLS for No-Information treatment (column 1 of Table 2):
    regress b_to_1 female score2 change if info == 0, cformat(%6.3f) 
    test female
    noi di " - No-Information treatment: _b[female] = " %3.0f _b[female]*100 "% | p = " %4.3f r(p)

    // OLS for No-Information treatment (column 2):
    regress b_to_1 female score2 change if info == 1, cformat(%4.3f) 
    test female
    noi di " - Information treatment:    _b[female] = " %3.0f _b[female]*100 "% | p = " %4.3f r(p)

    noi di "********************************************************"
    di "Footnote 52: Table 4 with non-binary gender dummies"
    // Define non-binary gender dummies
    generate femalenb = (female==1)
    generate not_male = (female!=0)
    // Rerun Table 4 with female/not-female
    sum score2
    global m_score2 = r(mean)
    sum change
    global m_change = r(mean)
    sum b_to_1
    global m_b_to_1 = r(mean)
    foreach var of varlist femalenb not_male {  
        eststo clear
        // Run NV-no-information regressions for Table 4
        regress b_to_1 `var' score2 change if info == 0, cformat(%6.3f) 
        eststo, title("(1)")
        probit choice `var' score2 change        if info == 0
        margins, dydx(*) at((zero) `var' score2=$m_score2 change=$m_change) post cformat(%6.3f) 
        eststo, title("(3)")
        probit choice `var' score2 change b_to_1 if info == 0
        margins, dydx(*) at((zero) `var' score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
        eststo, title("(4)")
        test `var'
        global pval = r(p)
        // Print the table
        #delimit ;
            noi estout, style(fixed) cells(b(fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
            starlevels(* 0.1 ** 0.05 *** 0.01)
            stats(N r2, labels("N" "R2") fmt("0 3"))
            label legend
            ;
        #delimit cr
        noi di "********************************************************"
        noi di " - Gender effect for column (4): p = " %4.3f $pval
    }
    restore
}

//-----------------------------------------------------------------------
// ### Section 5.2. Implication for belief elicitations
//-----------------------------------------------------------------------
qui{
    noi di "********************************************************"
    di "QSR data"
    preserve
    // Select QSR data
    keep if scoring == 2 
    noi di ">>> For Figure A.4, see below"
    noi di "QSR false-report rates at non-centered priors"
    levelsof treat, local(levels)
    foreach l of local levels {
        sum false if treat == `l' & !center
        local treat_label "`: label (treat) `l''"
        noi di " - `treat_label': " %4.1f r(mean)*100 "%"
    }

    noi di "********************************************************" 
    di "Footnote 55"
    // Recode such that higher values correspond to more risk aversion
    replace risk_switch_ce = 11-risk_switch_ce 
    probit false risk_switch_ce if treat == 1, cluster(subjectid)
    test risk_switch_ce
    noi di " - CE-method: p = " %4.3f r(p)
    probit false risk_switch_pe if treat == 1, cluster(subjectid)
    test risk_switch_pe
    noi di " - PE-method: p = " %4.3f r(p)
    noi di "********************************************************" 
    restore 
}

//-----------------------------------------------------------------------
qui{ 
    noi di "********************************************************"     
    noi di "*** Description treatment"
    preserve
    // Select BSR data
    keep if scoring == 1 
    noi di ">>> For Figure A.5, see below"
    noi di "Column 1 of Table 2 (All Priors)"
    prop false if t_cats!=., over(t_cats) vce(cluster subjectid)
    test _b[1.false@50.t_cats]  == _b[1.false@30.t_cats] 
    noi di "Description vs No-Information: " %4.3f _b[1.false@50.t_cats] " | " %4.3f _b[1.false@30.t_cats] " |  p = " %4.3f r(p)
    test _b[1.false@50.t_cats]  == _b[1.false@10.t_cats] 
    noi di "Description vs Information:    " %4.3f _b[1.false@50.t_cats] " | " %4.3f _b[1.false@10.t_cats] " |  p = " %4.3f r(p)

    // Column 2-3 of Table 2 ("By Prior")
    prop false if t_cats!=., over(center t_cats) vce(cluster subjectid)
    // test _b[1.false@1.center#20.t_cats]  == _b[1.false@0.center#20.t_cats] 
    test _b[1.false@1.center#50.t_cats]  == _b[1.false@0.center#50.t_cats] 
    noi di "Description center vs no-center:          " %4.3f _b[1.false@1.center#50.t_cats] " | " %4.3f _b[1.false@0.center#50.t_cats] " | p = " %4.3f r(p)

    // Column 4-6 of Table 2 ("False-Report Type")
    prop false_type if t_cats!=. & !center, over(t_cats) vce(cluster subjectid)
    test _b[1.false_type@50.t_cats]  == _b[2.false_type@50.t_cats] 
    noi di "Description to-center vs to-near-extreme: " %4.3f _b[1.false_type@50.t_cats] " | " %4.3f _b[2.false_type@50.t_cats] " | p = " %4.3f r(p)

    noi di "********************************************************"  
    noi di "Footnote 60: Time trend in Description"
    regress false period if treat == 5, cluster(subjectid)
    test period
    noi di " - Description: _b[period] = "  %4.3f _b[period] " | p = " %4.3f  r(p)

    noi di "********************************************************"  
    noi di "Footnote 61: Survey questions"
    // Get variable labels (original questions)
    local lab1: variable label agree1
    local lab2: variable label agree2
    local lab3: variable label agree3
    // Binarize response scale to agree/not agree
    generate understd_pay_calc = (agree1>3)
    generate belief_affect_pay = (agree2>3)
    generate always_most_accur = (agree3>3)
    // One observation per subject
    collapse treat understd_pay_calc belief_affect_pay always_most_accur, by(subjectid)
    label var understd_pay_calc "`lab1'"
    label var belief_affect_pay "`lab2'"
    label var always_most_accur "`lab3'"
    label values treat ltreatment
    noi di "  " `""`lab1'""'
    sum understd_pay_calc if treat == 5
    noi di "   - Description: " %2.0f r(mean)*100 "%"
    sum understd_pay_calc if treat == 3
    noi di "   - No-Information: " %2.0f r(mean)*100 "%"
    tab treat understd_pay_calc if (treat == 3 | treat == 5), row chi2 nokey
    noi di "   - p = " %4.3f r(p)
    noi di "********************************************************"  
    noi di "  " `""`lab2'""'
    sum belief_affect_pay if treat == 5
    noi di "   - Description: " %2.0f r(mean)*100 "%"
    sum belief_affect_pay if treat == 3
    noi di "   - No-Information: " %2.0f r(mean)*100 "%"
    tab treat belief_affect_pay if (treat == 3 | treat == 5), row chi2 nokey
    noi di "   - p = " %4.3f r(p)
    noi di "********************************************************"  
    noi di "  " `""`lab3'""'
    sum always_most_accur if treat == 5
    noi di "   - Description: " %2.0f r(mean)*100 "%"
    sum always_most_accur if treat == 3
    noi di "   - No-Information: " %2.0f r(mean)*100 "%"
    tab treat always_most_accur if (treat == 3 | treat == 5), row chi2 nokey
    noi di "   - p = " %4.3f r(p)
    noi di "********************************************************"  
    restore 
}

//-----------------------------------------------------------------------
qui{ 
    noi di "********************************************************"     
    noi di "*** Incentives-only treatments"
    preserve
    use data/data-incentives-only, clear
    export delimited using "data/data-incentives-only.csv", nolabel replace //export csv for Mathematica file
    // Show in terms of likelihood of Red ticket
    noi sum    
    reshape long choice_p, i(id) j(p_red)
    rename choice_p choice
    noi di "********************************************************" 
    noi di "Footnote 64"
    noi di "   Deviations to center"
    generate to_center = (p_red == 20 & (choice == 50 | choice == 40 | choice== 30)) | (p_red == 30 & (choice == 50 | choice == 4))
    sum to_center if p_red == 20
    noi di "   - 20% Red: " %4.1f r(mean)*100 "%"
    sum to_center if p_red == 30
    noi di "   - 30% Red: " %4.1f r(mean)*100 "%"
    noi di "********************************************************" 
    noi di "   Deviations to near extreme"
    generate to_near_extreme = (p_red == 20 & (choice == 0 | choice == 10)) | (p_red == 30 & (choice == 0 | choice == 10 | choice == 20))
    sum to_near_extreme if p_red == 20
    noi di "   - 20% Red: " %4.1f r(mean)*100 "%"
    sum to_near_extreme if p_red == 30
    noi di "   - 30% Red: " %4.1f r(mean)*100 "%"
    noi di "********************************************************"
    restore
}

//-----------------------------------------------------------------------
// ### APPENDIX A
// #### Table A.1
//-----------------------------------------------------------------------
qui{
    preserve
    gen eFalse = ( abs(belief1-pur)>5 )
    // Select BSR data
    keep if scoring == 1
    // Column 1 Overall rates
    noi prop i(1).eFalse if t_cats!=., over(t_cats) vce(cluster subjectid) cformat(%4.3f)
    gen asym=center==0
    // Columns 2/3 (if symmetric or asymmetric prior location)
    noi prop i(1).eFalse if t_cats!=., over(asym t_cats ) vce(cluster subjectid) cformat(%4.3f)
    noi di "********************************************************" 
    noi di "Comparisons to Information (Centered)" 
    foreach treat of numlist `ComparisonTreatmentList' {
         //Look at difference relative to Information
         lincom 1.eFalse@10.t_cats#0.asym-1.eFalse@`treat'.t_cats#0.asym
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    noi di "********************************************************" 
    noi di "Comparisons to Information (Non-Centered)" 
    foreach treat of numlist `ComparisonTreatmentList' {
         //Look at difference relative to Information
         lincom 1.eFalse@10.t_cats#1.asym-1.eFalse@`treat'.t_cats#1.asym
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    noi di "********************************************************" 
    restore
}

//-----------------------------------------------------------------------
// #### Table A.2
//-----------------------------------------------------------------------
qui{
    preserve
    // Select BSR data
    keep if scoring == 1
    //reshape to long
    reshape long belief post, i(id) j(guess)
    // get rid of the prior data
    keep if guess>1
    // Create distant_report
    gen distant_report = ( abs(belief-post) > 15 )
    // Column 1 Overall rates
    noi di  "********************************************************" 
    noi di  "Raw proportions distant reports" 
    noi prop i(1).distant_report if t_cats!=., over(t_cats) vce(cluster subjectid) cformat(%4.3f)
    noi di "********************************************************" 
    noi di "Comparisons to Information (Centered)" 
    foreach treat of numlist `ComparisonTreatmentList' {
        //Look at difference relative to Information
         lincom 1.distant_report@10.t_cats-1.distant_report@`treat'.t_cats
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    recode post (0/14.9=1) (14.91/35.1=1) (35.1/64.9=0) (64.91/85.09=1) (85.1/100=1), gen(non_central)
    recode post (0/14.9=2) (14.91/35.1=3) (35.1/64.9=1) (64.91/85.09=3) (85.1/100=2), gen(post_location)
    label define Non_Central 1 "Non-centered" 0 "Centered"
    label define Post_Location 2 "Extreme" 3 "Intermediate" 1 "Centered"
    label values non_central Non_Central
    label values post_location Post_Location
    noi di  "********************************************************" 
    noi di  "Proportion distant reports by posterior location (Columns 2/3)" 
    noi prop i(1).distant_report if t_cats!=., over(non_central t_cats ) vce(cluster subjectid) cformat(%4.3f)
    noi di  "********************************************************" 
    noi di "Comparisons to Information (Centered)" 
    foreach treat of numlist `ComparisonTreatmentList' {
        //Look at difference relative to Information
         lincom 1.distant_report@0.non_central#10.t_cats-1.distant_report@0.non_central#`treat'.t_cats
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    noi di  "********************************************************" 
    noi di "Comparisons to Information (Non-Centered)" 
    foreach treat of numlist `ComparisonTreatmentList' {
         //Look at difference relative to Information
         lincom 1.distant_report@1.non_central#10.t_cats-1.distant_report@1.non_central#`treat'.t_cats
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    noi di  "********************************************************" 
    noi di  "Proportion distant reports by posterior location for Intermediate (Column 4)" 
    noi prop i(1).distant_report if t_cats!=., over(post_location t_cats) vce(cluster subjectid) cformat(%4.3f)
    noi di  "********************************************************" 
    noi di "Comparisons to Information (Intermediate)" 
    foreach treat of numlist `ComparisonTreatmentList' {
         //Look at difference relative to Information
         lincom 1.distant_report@3.post_location#10.t_cats-1.distant_report@3.post_location#`treat'.t_cats
         noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
    }
    noi di  "So:" 
    noi di  ">> Footnote 41 in main text "
    prop distant_report if t_cats!=., over(t_cats post_location) vce(cluster subjectid)
    lincom  1.distant_report@10.t_cats#3.post_location - 1.distant_report@20.t_cats#3.post_location
    noi di "   - Intm. RCL v Information p = " %4.3f r(p)
    lincom 1.distant_report@10.t_cats#3.post_location-1.distant_report@30.t_cats#3.post_location
    noi di "   - Intm. NoInformation v Information p = " %4.3f r(p)
    gen     belief_movement= 1 if (belief==50 & post<50) | (belief==50 & post>50) //exact center
    replace belief_movement= 3 if (belief>50 & post<50) | ( belief<50 & post>50 ) //far extreme
    replace belief_movement= 2 if (belief==0 & post<50) | (belief==100 & post>50) //near extreme
    replace belief_movement=0 if belief_movement==.
    label define Belief_Movement 2 "Near-Extreme" 3 "Far-Extreme" 1 "Exact-Center"
    label values belief_movement Belief_Movement
    // Symmetrized version of posterio in [0,50]
    gen postSym=min(post,100-post)
    foreach movement of numlist 1/3 {     // For each of the three columns
        noi di  "********************************************************" 
        noi di  "Table Column (`: label (belief_movement) `movement'' movement)" 
        // Display the proportions for this column
        noi prop i(`movement').belief_movement if t_cats!=. & 15<=postSym & postSym<=35, over(t_cats) vce(cluster subjectid) cformat(%4.3f)
        noi di  "********************************************************" 
        noi di "Comparisons to Information (`: label (belief_movement) `movement'' movement)"
        foreach treat of numlist `ComparisonTreatmentList' {   //For each of the comparisons
            //Look at difference relative to Information
             lincom `movement'.belief_movement@10.t_cats-`movement'.belief_movement@`treat'.t_cats
             noi di " - `: label (t_cats) `treat''   p=" %4.3f r(p) //Report p-value
        }
    }
    noi di  "********************************************************" 
    restore
}

//-----------------------------------------------------------------------
// #### Figure A1 "Responses to post-experimental questionnaire"
//-----------------------------------------------------------------------
quietly {
    preserve
    // Select post-experiment question 3 from BSR data:
    keep if scoring == 1
    keep id treatment subjectid agree3
    // Have one row per subject:
    collapse treatment agree3, by(subjectid)
    // Binarize agreement (agree vs. not agree):
    generate double agree3bin = .
    replace agree3bin = 1 if agree3 >= 4
    replace agree3bin = 0 if agree3 <  4
    // Get treatment averages and confidence intervals:
    collapse (mean)  meanb=agree3bin (sd) sdb=agree3bin (count) n=agree3bin, by(treatment)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    // Print figure:
    #delimit ;
        graph twoway
        (bar meanb treatment, lwidth(0.01) lcolor(white) fcolor(gs5))
        (rcap hib lob treatment, lcolor(black) msize(small) lwidth(vthin)),
        aspectratio(1.2)
        ysize(7.5) 
        xsize(6)
        ytitle("Fraction of affirmative answers", margin(zero) size(large) ) 
        title("I always reported" "my most accurate guess on" "the Red urn being the selected urn", margin(zero) size(vlarge) color(black)) 
        xtitle("")
        xlabel("", noticks)
        ytick(.4(.05)1, tlwidth(vthin))
        ymtick(.4(.01)1, tlwidth(vthin))
        ylabel(.4(0.1)1,  glwidth(0.1) glcolor("230 230 230") angle(horizontal) format(%3.1f) labsize(large))
        graphregion(color(none) icolor(none) margin(zero))
        plotregion( color(none) icolor(none) margin(zero))
        bgcolor(white)
        legend(off)
        yline($solved)
        name($filename)
        plotregion( m(b=0) )
        text(.42 1 "Information",    placement(n) orientation(vertical) color(white) size(large)) 
        text(.42 2 "RCL Calculator", placement(n) orientation(vertical) color(white) size(large)) 
        text(.42 3 "No Information", placement(n) orientation(vertical) color(white) size(large)) 
        text(.42 4 "Feedback", 		 placement(n) orientation(vertical) color(white) size(large)) 
        text(.42 5 "Description",    placement(n) orientation(vertical) color(white) size(large)) 
        ;
    #delimit cr
    graph export "figures/pdf/figure_A1.pdf", replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
// #### Figure A3 "Share of participants who consistently report the prior"
//-----------------------------------------------------------------------
quietly {
    preserve
    // Select prior reports from BSR data:
    keep if scoring == 1
    keep id treatment subjectid period belief1 pur
    // Get indicator for participants with zero false report rate:
    generate false = (belief1 != pur)
    collapse treat false, by(subjectid) 
    generate all_right = (false==0)
    // Reorder treatments:
    generate double treat_cats = treatment-1
    // Get treatment averages and confidence intervals:
    collapse (mean) meanb=all_right (sd) sdb=all_right (count) n=all_right, by(treat_cats)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    // Print figure:
    #delimit ;
        graph twoway
        (bar meanb treat_cats, lwidth(0.2) lcolor(white) fcolor(gs5))
        (rcap hib lob treat_cats, lcolor(black) msize(small) lwidth(vthin)),
        aspectratio(1.2)
        ysize(5.5) 
        xsize(5)
        ytitle("All prior reports correct (10/10)", margin(zero) size(medlarge)) 
        xtitle("")
        xlabel(2.5 " " , noticks labsize(small))
        ytick(0(.05)0.65)
        ymtick(0(.01)0.65)
        ylabel(0(0.05)0.65,  glwidth(0.001) glcolor("230 230 230") angle(horizontal) format(%3.2f))
        graphregion(color("255 255 255") margin(zero))
        bgcolor(white)
        legend(off)
        plotregion( m(b=0) )
        text(0.01 0 "Information",    placement(n) orientation(vertical)  color(white) size(medlarge)) 
        text(0.01 1 "RCL", 		      placement(n) orientation(vertical)  color(white) size(medlarge)) 
        text(0.01 2 "No-Information", placement(n) orientation(vertical)  color(white) size(medlarge)) 
        text(0.01 3 "Feedback", 	  placement(n) orientation(vertical)  color(white) size(medlarge)) 
        text(0.01 4 "Description",    placement(n) orientation(vertical)  color(white) size(medlarge)) 
        ;
    #delimit cr
    qui graph export figures/pdf/figure_A3.pdf, replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
// #### Figure A4 "False reports under QSR with and without information"
//-----------------------------------------------------------------------
quietly {
    // ::: FIGURE A4.A
    preserve
    // Select prior reports from QSR data:
    keep if scoring == 2
    keep id treatment subjectid period false
    // Get treatment averages and confidence intervals:
    collapse (mean) meanb=false (sd) sdb=false (count) n=false, by(treat period)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    #delimit ;
    graph twoway 
        scatter meanb period if treat == 3, connect(direct) msymbol(Oh) msize(medsmall) lpattern(shortdash) color(black)
    ||	scatter meanb period if treat == 1, connect(direct) msymbol(T) msize(medsmall) lpattern(solid) color(black)
        ,
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Period", margin(small) size(medlarge)) 
        xlabel(#10, labsize(medlarge) tlwidth(vthin) nogrid )
        ylabel(0(.1)0.6,  labsize(medlarge) glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f))	
        ymtick(0(.01)0.6, tlwidth(vthin))
        ytick(0(.05)0.6, tlwidth(vthin))
        graphregion(color("255 255 255") margin(zero))
        legend( col(1) lab(1 "No Information") lab(2 "Information")
            region(fcolor(white) lwidth(vthin)) size(medlarge) position(0) bplacement(sw) order(2 1) )
        graphregion(color(white) margin(zero))
        plotregion(margin(medsmall))
        name($filename, replace)
        ;
    #delimit cr
    qui graph export figures/pdf/figure_A4_A.pdf, replace as(pdf)
    restore
}
//-----------------------------------------------------------------------
qui{
    preserve
    // Select prior reports from QSR data:
    keep if scoring == 2
    keep id treatment subjectid period pur false
    // Generate consecutive numbers on x-axis for each prior and treatment:
    generate catvar = .
    local val = 0
    levelsof pur, local(levelsofvar)
    foreach p of local levelsofvar {
        local val = `val'+1
        replace catvar = `val' +  0 if pur == `p' & treat == 1
        replace catvar = `val' + 6  if pur == `p' & treat == 3
    }
    // Get treatment averages and confidence intervals:
    collapse (mean) catvar meanb=false (sd) sdb=false (count) n=false, by(treatment pur)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    #delimit ;
        graph twoway
        (bar meanb catvar, lwidth(0.1) lcolor(white) fcolor(gs5))
    ||	(rcap hib lob catvar, lcolor(black) msize(small) lwidth(vthin)),
        aspectratio(1)
        ysize(5) 
        xsize(5)			
        ytitle("Fraction of false prior reports", margin(zero) size(medlarge)) 
        xtitle("Known prior of Red Urn", margin(small) size(medlarge))
        xlabel(2.5 " " , noticks labsize(medlarge))
        ytick(0(.05)0.8)
        ymtick(0(.01)0.8)
        ylabel(0(0.1)0.8, glwidth(0.1) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
        graphregion(color("255 255 255") margin(zero))
        legend(off)
        plotregion( m(b=0) )
        text(0.02  1 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  2 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  3 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  4 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  5 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  7 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  8 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02  9 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 10 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(0.02 11 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge)) 
        text(-0.045 3 "Information",    placement(n) orientation(horizontal) color(black) size(medlarge)) 
        text(-0.045 9 "No Information", placement(n) orientation(horizontal) color(black) size(medlarge)) 
        ;
    #delimit cr
    qui graph export figures/pdf/figure_A4_B.pdf, replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
// #### Figure A5 "False reports under the BSR Description Treatment"
//-----------------------------------------------------------------------
quietly {
    //FIGURE A5.A
    preserve
    // Select prior reports from BSR data:
    keep if scoring == 1
    keep id treatment subjectid period pur false
    // Get indicator for false report:
    collapse false, by(treat period)
    #delimit ;
    graph twoway 
        scatter false period if treat == 3, connect(direct) msymbol(Oh) msize(medsmall) lpattern(shortdash) color(gs12)
    ||	scatter false period if treat == 5, connect(direct) msymbol(O)  msize(medsmall) lpattern(shortdash) color(black)
    ||	scatter false period if treat == 4, connect(direct) msymbol(Oh) msize(medsmall) lpattern(solid) color(gs12)
    ||	scatter false period if treat == 1, connect(direct) msymbol(T)  msize(medsmall) lpattern(solid) color(gs12)
    ||	scatter false period if treat == 2, connect(direct) msymbol(D)  msize(medsmall) lpattern(solid) color(gs12)
        ,
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Period", margin(small) size(medlarge)) 
        xlabel(#10, labsize(medlarge) tlwidth(vthin) nogrid )
        ylabel(0(.1).6,  labsize(medlarge) glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f))	
        ymtick(0(.01).6, tlwidth(vthin))
        ytick(0(.05).6, tlwidth(vthin))
        graphregion(color("255 255 255") margin(zero))
        legend(rows(3) colfirst 
        lab(1 "No Information") lab(2 "Description") lab(3 "Feedback")  lab(4 "Information") lab(5 "RCL Calculator") 
        region(fcolor(white) lwidth(vthin)) size(medlarge) position(0) bplacement(sw) order(4 1 5 3 2) )
        graphregion(color(white) margin(small))
        plotregion(margin(small))
        name($filename, replace)
        ;
    #delimit cr
    graph export figures/pdf/figure_A5_B.pdf, replace as(pdf)
    restore
}

//-----------------------------------------------------------------------
qui{
    // ::: FIGURE A5.B
    preserve
    // Select prior reports from BSR Description treatment:
    keep if scoring == 1 & treatment == 5
    keep id treatment subjectid period pur false
    // Generate consecutive numbers on x-axis for each prior:
    generate catvar = .
    local val = 0
    levelsof pur, local(levelsofvar)
    foreach p of local levelsofvar {
        local val = `val'+1
        replace catvar = `val' + 0 if pur == `p'
    }
    // Get averages per prior and confidence intervals:
    collapse (mean) catvar meanb=false (sd) sdb=false (count) n=false, by(pur)
    generate hib = meanb + invttail(n-1,0.025)*(sdb / sqrt(n))
    generate lob = meanb - invttail(n-1,0.025)*(sdb / sqrt(n))
    #delimit ;
        graph twoway
        (bar meanb catvar, lwidth(0.1) lcolor(white) fcolor(gs5))
    ||	(rcap hib lob catvar, lcolor(black) msize(small) lwidth(vthin)),
        aspectratio(1)
        ysize(6) 
        xsize(6)
        ytitle("Fraction of false reports", margin(zero) size(medlarge)) 
        xtitle("Known prior of Red Urn", margin(small) size(medlarge) )
        xlabel(2.5 " " , noticks labsize(medlarge) nogrid )
        ytick(0(.05).8)
        ymtick(0(.01).8)
        ylabel(0(0.1).8,  glwidth(0.2) glcolor("230 230 230") angle(horizontal) format(%2.1f) labsize(medlarge))
        graphregion(color(white) margin(zero))
        legend(off)
        plotregion(margin(medsmall))
        text(0.02 1 "0.2", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 2 "0.3", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 3 "0.5", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 4 "0.7", placement(n) orientation(horizontal) color(white) size(medlarge))
        text(0.02 5 "0.8", placement(n) orientation(horizontal) color(white) size(medlarge))
        ;
    #delimit cr
    qui graph export figures/pdf/figure_A5_B.pdf, replace as(pdf)
    restore 
}

//-----------------------------------------------------------------------
// ### Appendix B
//#### Table B1: Estimated center bias from beliefs about objective priors."
//-----------------------------------------------------------------------
quietly {
    preserve
    // Select prior reports from BSR data:
    use data/data-bsr-qsr.dta, clear
    keep if scoring == 1
    keep if treatment == 1 | treatment == 3
    keep id treatment subjectid period pur belief1
    // Create variable with center belief
    generate cent = 50
    // Calculate entropy of priors in BSR data
    generate double entropy = (- pur/100*ln(pur/100) - (1-pur/100)*ln(1-pur/100)) / ln(2)
    // Run the regressions
    eststo clear
    // Column (1)
    nl (belief = (1-{alpha_0})*pur + {alpha_0}*cent) if treat == 3, vce(cluster subjectid)
    eststo, title("No-Info all")
    test _b[/alpha_0] == 0
    global p_1 = r(p)
    // Column (2)
    nl (belief = (1-{alpha_0})*pur + {alpha_0}*cent) if treat == 3 & (pur == 30 | pur == 70), vce(cluster subjectid)
    eststo, title("NoInf 30/70")
    // Column (3)
    nl (belief = (1-{alpha_0})*pur + {alpha_0}*cent) if treat == 3 & (pur == 20 | pur == 80), vce(cluster subjectid)
    eststo, title("NoInf 20/80")
    // Column (4)
    nl (belief = (1-({alpha_0}+{alpha_e}*(1-entropy)))*pur + ({alpha_0}+{alpha_e}*(1-entropy))*cent) if treat == 3, vce(cluster subjectid)
    eststo, title("NoInf divergence dependent")
    // Column (5)
    nl (belief = (1-{alpha_0})*pur + {alpha_0}*cent) if treat == 1, vce(cluster subjectid)
    eststo, title("Info all")
    test _b[/alpha_0] == 0
    global p_2 = r(p)
    // Column (6)
    nl (belief = (1-{alpha_0})*pur + {alpha_0}*cent) if treat == 1 & (pur == 30 | pur == 70), vce(cluster subjectid)
    eststo, title("Info 30/70")
    // Column (7)
    nl (belief = (1-{alpha_0})*pur + {alpha_0}*cent) if treat == 1 & (pur == 20 | pur == 80), vce(cluster subjectid)
    eststo, title("Info 20/80")
    // Column (8)
    nl (belief = (1-({alpha_0}+{alpha_e}*(1-entropy)))*pur + ({alpha_0}+{alpha_e}*(1-entropy))*cent) if treat == 1, vce(cluster subjectid)
    eststo, title("Info divergence dependent")

    // Print the table
    #delimit ;
        noisily estout, style(fixed) cells(b( fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        stats(N r2, labels("N" "R2") fmt("0 3"))
        label legend numbers
        rename( ///
            alpha_0:_cons "alpha/alpha_0" ///
            alpha_e:_cons "alpha_1" ///
        )
        eqlabels("(1)" "(2)" )
        ;
    #delimit cr

    // Compare No-Information (column 1) and Information (column 5)
    generate info = (treat==1)
    nl (belief = (1-({alpha_0}+{d_alpha}*info))*pur + ({alpha_0}+{d_alpha}*info)*cent), vce(cluster subjectid)
    test _b[/d_alpha] == 0
    global p_3 = r(p)

    // Compare "less extreme" (column 6) and "more extreme" (column 7) in Information
    generate extreme = (pur == 20 | pur == 80)
    nl (belief = (1-({alpha_0}+{d_alpha}*extreme))*pur + ({alpha_0}+{d_alpha}*extreme)*cent) if treat == 1, vce(cluster subjectid)
    test _b[/d_alpha] == 0
    global p_4= r(p)

    noi di"********************************************************" 
    noi di " - Column (1), alpha != 0: p = " %6.3f $p_1
    noi di " - Column (5), alpha != 0: p = " %6.3f $p_2
    noi di " - Column (1) vs (5):      p = " %6.3f $p_3
    noi di " - Column (6) vs (7):      p = " %6.3f $p_4

    noi di"********************************************************" 
    noi di "Footnote 4 (Online Appendix), Tobit regressions:"

    // Define constraint for tobit regressions
    constraint define 1 cent + pur = 1

    // Run the regressions
    tobit belief cent pur if treat == 3, noconstant constraint(1) ll(0) ul(100) vce(cluster subjectid) 
    noi di " - No-Information (b/se), cp. column (1) in Table B.1:"
    noi di "   " %6.3f e(b)[1,1]
    noi di "   (" %4.3f  sqrt(e(V)[1,1]) ")"

    tobit belief cent pur if treat == 1, noconstant constraint(1) ll(0) ul(100) vce(cluster subjectid) 
    noi di " - Information (b/se), cp. column (5) in Table B.1:"
    noi di "   " %6.3f e(b)[1,1]
    noi di "   (" %4.3f  sqrt(e(V)[1,1]) ")"


    noi di"********************************************************"  
    noi di "Footnote 5 (Online Appendix):"
    // Compare "less extreme" (column 6) and "more extreme" (column 7) in No Information
    nl (belief = (1-({alpha_0}+{d_alpha}*extreme))*pur + ({alpha_0}+{d_alpha}*extreme)*cent) if treat == 3, vce(cluster subjectid)
    test _b[/d_alpha] == 0
    noi di " - Column (2) vs (3):      p = " %6.3f r(p)
    noi di"********************************************************" 

    restore
}


//-----------------------------------------------------------------------
// #### Table B2: Simulation of center bias: Beliefs as a LHS Variable.
//-----------------------------------------------------------------------
quietly {
    preserve
    // Select NV-replication data:
    use data/data-nv.dta, clear
    // Get difference in Tournament and Piece-rate performance
    generate double change = score2-score1
    // Relabel variables for output
    label var female "Female"
    label var score2 "Tournament"
    label var change "Tournament-Piece rate"
    // Change beliefs from percent to probability:
    forvalues i = 1(1)4 {
        replace b_to_`i' = b_to_`i'/100
    }
    eststo clear
    // Column (1)
    regress b_to_1 female score2 change if info == 0
    eststo, title("NoInfo, actual data")
    // Columns (2)-(6), from stored data. See file "simulations\AER-2020-1248_simulations.do" for replication.
    estimates use simulations/simulation-results/sims_n10000_lhs_column_2
    eststo, title("alpha=0")
    estimates use simulations/simulation-results/sims_n10000_lhs_column_3
    eststo, title("alpha=0.223")
    estimates use simulations/simulation-results/sims_n10000_lhs_column_4
    eststo, title("alpha=0.5")
    estimates use simulations/simulation-results/sims_n10000_lhs_column_5
    eststo, title("alpha=.05+.88*KL(b,u)")
    // Column (6)
    regress b_to_1 female score2 change if info == 1
    eststo, title("Info, actual data")
    // Print the table
    #delimit ;
        noisily estout, style(fixed) cells(b(star fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        starlevels(* 0.1 ** 0.05 *** 0.01)
        stats(N r2, labels("N" "R2") fmt("0 3"))
        rename( ///
            _bs_1 "Female" ///
            _bs_2 "Tournament" ///
            _bs_3 "Tournament-piece_rate" ///
            _cons "Constant" ///
            _const "Constant"
        )
        label legend numbers
        ;
    #delimit cr
    restore
}

//-----------------------------------------------------------------------
// #### Table B.3: Simulation of center bias: Beliefs as a RHS Variable.
//-----------------------------------------------------------------------
qui{
    preserve
    // Select NV-replication data:
    use data/data-nv.dta, clear
    // Get difference in Tournament and Piece-rate performance
    generate double change = score2-score1
    // Relabel variables for output
    label var female "Female"
    label var score2 "Tournament"
    label var change "Tournament-Piece rate"
    // Change beliefs from percent to probability
    forvalues i = 1(1)4 {
        replace b_to_`i' = b_to_`i'/100
    }
    // Get averages of all independent variables over all treatments, to have the same point of comparison for marginal effects
    sum score2
    global m_score2 = r(mean)
    sum change
    global m_change = r(mean)
    sum b_to_1
    global m_b_to_1 = r(mean)

    eststo clear
    // Column (1)
    probit choice female score2 change b_to_1 if info == 0
    noi di "Pseudo R2 = " %6.3f e(r2_p)
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
    eststo, title("NoInfo, actual data")

    // Columns (2)-(6), from stored data. See file "simulations\AER-2020-1248_simulations.do" for replication.
    estimates use simulations/simulation-results/sims_n10000_rhs_column_2
    eststo, title("alpha=0")
    estimates use simulations/simulation-results/sims_n10000_rhs_column_3
    eststo, title("alpha=0.223")
    estimates use simulations/simulation-results/sims_n10000_rhs_column_4
    eststo, title("alpha=0.5")
    estimates use simulations/simulation-results/sims_n10000_rhs_column_5
    eststo, title("alpha=.05+.88*KL(b,u)")
    // Column (6)
    probit choice female score2 change b_to_1 if info == 1
    noi di "Pseudo R2 = " %6.3f e(r2_p)
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
    eststo, title("Info, actual data")

    // Print the table
    #delimit ;
        noisily estout, style(fixed) cells(b(star fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        starlevels(* 0.1 ** 0.05 *** 0.01)
        stats(N r2, labels("N" "R2") fmt("0 3"))
        rename( ///
            _bs_1 "Female" ///
            _bs_2 "Tournament" ///
            _bs_3 "Tournament-piece_rate" ///
            _cons "Constant"
        )
        label legend numbers
        ;
    #delimit cr
    restore
}


//-----------------------------------------------------------------------
// #### Table B.4: Simulation of center bias reversal: Beliefs as a LHS Variable.
//-----------------------------------------------------------------------
qui{
    preserve
    // Select NV-replication data:
    use data/data-nv.dta, clear
    // Get difference in Tournament and Piece-rate performance
    generate double change = score2-score1
    // Relabel variables for output
    label var female "Female"
    label var score2 "Tournament"
    label var change "Tournament-Piece rate"
    // Change beliefs from percent to probability
    forvalues i = 1(1)4 {
        replace b_to_`i' = b_to_`i'/100
    }
    eststo clear
    // Column (1)
    regress b_to_1 female score2 change if info == 1
    eststo, title("Info, actual data")
    // Columns (2)-(3), from stored data. See file "simulations\AER-2020-1248_simulations-reverse.do" for replication.
    estimates use simulations/simulation-results/sims_n10000_reverse_lhs_column_2
    eststo, title("alpha=0.223")
    estimates use simulations/simulation-results/sims_n10000_reverse_lhs_column_3
    eststo, title("alpha=0.5")
    // Column (4)
    regress b_to_1 female score2 change if info == 0
    eststo, title("NoInfo, actual data")
    // Print the table
    #delimit ;
        noisily estout, style(fixed) cells(b(star fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        starlevels(* 0.1 ** 0.05 *** 0.01)
        stats(N r2, labels("N" "R2") fmt("0 3"))
        rename( ///
            _bs_1 "Female" ///
            _bs_2 "Tournament" ///
            _bs_3 "Tournament-piece_rate" ///
            _cons "Constant" ///
            _const "Constant"
        )
        label legend numbers
        ;
    #delimit cr
    restore
}

//-----------------------------------------------------------------------
// #### Table B.5: Simulation of center bias reversal: Beliefs as a RHS Variable
//-----------------------------------------------------------------------
qui{
    preserve
    // Select NV-replication data:
    use data/data-nv.dta, clear
    // Get difference in Tournament and Piece-rate performance
    generate double change = score2-score1
    // Relabel variables for output
    label var female "Female"
    label var score2 "Tournament"
    label var change "Tournament-Piece rate"
    // Change beliefs from percent to probability
    forvalues i = 1(1)4 {
        replace b_to_`i' = b_to_`i'/100
    }
    eststo clear
    // Column (1)
    probit choice female score2 change b_to_1 if info == 1
    noi di "Pseudo R2 = " %6.3f e(r2_p)
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
    eststo, title("Info, actual data")
    // Columns (2)-(3), from stored data. See file "simulations\AER-2020-1248_simulations-reverse.do" for replication.
    estimates use simulations/simulation-results/sims_n10000_reverse_rhs_column_2
    eststo, title("alpha=0.223")
    estimates use simulations/simulation-results/sims_n10000_reverse_rhs_column_3
    eststo, title("alpha=0.5")
    // Column (4)
    probit choice female score2 change b_to_1 if info == 0
    noi di "Pseudo R2 = " %6.3f e(r2_p)
    margins, dydx(*) at((zero) female score2=$m_score2 change=$m_change b_to_1=$m_b_to_1) post
    eststo, title("NoInfo, actual data")
    // Print the table
    #delimit ;
        noisily estout, style(fixed) cells(b(star fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
        starlevels(* 0.1 ** 0.05 *** 0.01)
        stats(N r2, labels("N" "R2") fmt("0 3"))
        rename( ///
            _bs_1 "Female" ///
            _bs_2 "Tournament" ///
            _bs_3 "Tournament-piece_rate" ///
            _cons "Constant" ///
            _const "Constant"
        )
        label legend numbers
        ;
    #delimit cr
    restore
}
