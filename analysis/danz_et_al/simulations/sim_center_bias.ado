program sim_center_bias, rclass
	version 17
	syntax [, model(string) ]

	preserve
	
	// Draw bootstrap sample, respecting size of treatment and gender group
	bsample, strata(female)	

	// Replace beliefs with center report, with probability alpha
	generate double rand_u = runiform()
	replace b_to_1 = 0.25 if rand_u <= alpha
	
	// Run the regressions with simulated center bias
	if "`model'" != "rhs" {
		capture regress b_to_1 female score2 change 
	}
	else {
		capture {
			probit choice female score2 change b_to_1
			margins, dydx(*) at((zero) female (mean) score2 change b_to_1) post
		}
	}
	
	// Return estimated coefficients upon successful estimation
	if (_rc==0) {
		return scalar female = _b[female]
		return scalar score2 = _b[score2]
		return scalar change = _b[change]
		if "`model'" != "rhs" {
			return scalar _const = _b[_cons]
		}
		else {
			return scalar b_to_1 = _b[b_to_1]
		}
	}
	else {
		return scalar female = .
		return scalar score2 = .
		return scalar change = .
		if "`model'" != "rhs" {
			return scalar _const = .
		}
		else {
			return scalar b_to_1 = .
		}
	}
	
	restore
	
end
