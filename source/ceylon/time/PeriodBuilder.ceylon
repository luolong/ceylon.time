
doc "Interface for creating periods"
shared class PeriodBuilder(Integer number) {
	
	doc "Returns the period of the specified number of years."
	shared Period years() {
		return Period{ years = number; };
	}
	
	doc "Returns the period of the specified number of months."
	shared Period months() {
		return Period{ months = number; };
	}
	
	doc "Returns the period of the specified number of days."
	shared Period days() {
		return Period{ days = number; };
	}
	
	doc "Returns the period of the specified number of weeks."
	shared Period weeks() {
		return Period{ days = 7*number; };
	}
	
	doc "Returns the period of the specified number of hours."
	shared Period hours() {
		return Period{ hours = number; };
	}
	
	doc "Returns the period of the specified number of minutes."
	shared Period minutes() {
		return Period{ minutes = number; };
	}
	
	doc "Returns the period of the specified number of seconds."
	shared Period seconds() {
		return Period{ seconds = number; };
	}
	
	doc "Returns the period of the specified number of milliseconds."
	shared Period milliseconds() {
		return Period{ milliseconds = number; };
	}
	
}

shared PeriodBuilder periodOf(Integer number) {
	return PeriodBuilder(number); 
}