program store_estimates, eclass
	version 17
	syntax [, model(string) using(string)]
	
	// Get explanatories, depending on model
	if "`model'" != "rhs" {
		global varlist = "female score2 change _const"
	}
	else {
		global varlist = "female score2 change b_to_1"
	}

	// Drop failed simulations, if any
	foreach var of global varlist {
		noi keep if `var' != .
	}

	// Initialize matrices 
	matrix b = J(1,4,.)
	matrix V = I(4)
	matrix p = J(1,4,.)

	// Add labels
	matrix colnames b = $varlist
	matrix colnames V = $varlist
	matrix rownames V = $varlist
	matrix colnames p = $varlist

	local i = 0
	foreach var of global varlist {
		local i = `i' + 1
		
		// Calculate bootstrap estimate and variance
		sum `var'
		matrix b[1,`i'] = r(mean)
		matrix V[`i',`i'] = r(Var)
		
		// Calculate bootstrap p-values
		if r(mean) > 0 count if `var' ~= . & `var' < 0
		if r(mean) < 0 count if `var' ~= . & `var' > 0
		matrix p[1,`i'] = (2*r(N))/_N
	}

	// Store estimates
	ereturn post b V

	// Add number of observations and p-values to stored estimates
	ereturn matrix p = p
	ereturn scalar N=_N

	// Save stored estimates to file
	eststo clear
	eststo 
	estimates save simulations\simulation-results\\`using', replace
	
end
