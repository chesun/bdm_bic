program sim_center_bias_reverse, rclass
	version 17
	syntax [, alpha(real 0)  model(string) ]

	preserve
	
	// Draw bootstrap sample, respecting size of treatment and gender group
	bsample, strata(female)	

	// Determine alpha share of beliefs closest to uniform, break ties randomly
	generate double randu = runiform() 
	sort center_dist randu
	generate double flip = (_n <= round(`alpha'*_N))
		
	capture {
		regress b_to_1 female score2 change if flip == 0
		
		replace b_to_1 = _b[_cons] + _b[female]*female + _b[score2]*score2 + _b[change]*change if flip == 1
		replace b_to_1 = 0 if b_to_1 < 0
		replace b_to_1 = 1 if b_to_1 > 1

		if "`model'" != "rhs" {
			regress b_to_1 female score2 change
		}
		else {
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
