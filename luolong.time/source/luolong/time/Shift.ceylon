doc "Result of a 'shift' operation on enumerated values.
     
     Shift operation will shift the value of enumerated value
     of the type `Result` specified number of times in the 
     selected direction, whrapping around if necessary.
     
     Resulting value will return a tuple consisting of number 
     of wrapping operations and resulting value of the shift 
     operation."
shared interface Shift<Result>
		given Result satisfies Ordinal<Result>{
	
	doc "Number of wrapping operations."
	shared formal Integer wraps;
	
	doc "Resulting value of the shift operation"
	shared formal Result result;
}
