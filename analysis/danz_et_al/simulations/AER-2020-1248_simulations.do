quietly {
program drop _all
graph drop _all
set more off
set trace off
cls

// ********************************************************************************
// >>> Change root folder here:
global localfolder "S:\replication\"
cd $localfolder

// >>> Choose whether re-run simulations (or to show stored bootstrap results):
global do_sim = 1

// >>> Choose number of simulations:
global nsims  = 10000  		// 10000 for paper; can do 100 for testing (low precision) 

// >>> Choose which table to replicate 
global model = "rhs" 		// "lhs" for Table B.2; "rhs" for Table B.3

// >>> Choose which column to replicate: 
global column = 5			// 2, 3, 4, or 5

// ********************************************************************************

// Fix stub for output file names
global filename "sims_n${nsims}_${model}_column_${column}"
	
if $do_sim {

	// Use NV-replication data:
	use data-nv.dta, clear
	
	// Select NV-no-information treatment:
	keep if info == 0 

	// Create required explanatory variable, difference between tournament and piece rate performance
	generate double change = score2-score1
	label var change "Tournament-piece_rate"

	// Beliefs as probability
	forvalues i = 1(1)4 {
		replace b_to_`i' = b_to_`i'/100
	}
	
	// Reduce data set for simulations
	keep id sessionid subjectid choice female score2 change b_to_*
	
	if $column == 2 {
		// No center bias, just plain bootstrap
		generate double alpha = 0
	}
	else if $column == 3 {
		// Constant center bias, using estimate from Table_B_1, column (5)
		generate double alpha = .2231373
	}
	else if $column == 4 {
		// Constant center bias, "inflated" value
		generate double alpha = .5
	}
	else if $column == 5 {
		// Calculate entropy for stated beliefs
		generate double entropy = 0
		forvalues i = 1(1)4 {										
			generate double e`i' = 0
			replace e`i' = - b_to_`i'*ln(b_to_`i') if b_to_`i' > 0
			replace entropy = entropy + e`i'
		}
		replace entropy = entropy/ln(4)
		
		// Calculate entropy-dependent chance of center report, using estimates from Table_B_1, column (8)
		generate double alpha = .0450878 + .8767555*(1-entropy)
	}

	// Fix random seed for exact replication
	set seed 0
	
	// Include function to simulate center bias
	run simulations\sim_center_bias.ado
	
	// Test a single simulation like so:
	// noi sim_center_bias, model("lhs")
	// noi di  %6.3f r(female) " | " %6.3f r(score2) " | " %6.3f r(change) " | " %6.3f r(_const)
	// noi sim_center_bias, model("rhs")
	// noi di  %6.3f r(female) " | " %6.3f r(score2) " | " %6.3f r(change) " | " %6.3f r(b_to_1)

	// Start timer
	timer clear 
	timer on 1
	
	// Setup parallelization
	noi parallel numprocessors
	global ncores = 18 	// choose number of processors to use
	parallel setclusters $ncores
	global seeds "1"
	forvalues c = 2(1)$ncores {
		global seeds "$seeds `c'"
	}
	
	// Run simulation
	noisily {
		if "$model" != "rhs" {
			parallel sim, seeds($seeds) reps($nsims) expr( ///
			female=r(female) score2=r(score2) change=r(change) _const=r(_const) ):  ///
			sim_center_bias
		}
		else {
			parallel sim, seeds($seeds) reps($nsims) expr( ///
			female=r(female) score2=r(score2) change=r(change) b_to_1=r(b_to_1) ):  ///
			sim_center_bias, model("rhs") 
		}
	}	
	
	// Stop and show timer
	timer off 1
	noi timer list 1
	
	// Save simulation data
	save simulations\simulation-results\\$filename, replace

}

// Open simulation data
use simulations\simulation-results\\$filename, clear

// Include function to calculate and store bootstrap estimates
run simulations\store_estimates.ado

// Calculate and store bootstrap estimates
store_estimates, model($model) using($filename)

// Print bootstrap estimates
#delimit ;
	noisily estout, style(fixed) cells(b(star fmt(3) label(b)) se(par(( )) fmt(3) label([se])))
	starlevels(* 0.1 ** 0.05 *** 0.01)
	stats(N ll, labels("N" "logL") fmt("0 3"))
	label legend
	;
#delimit cr


}
