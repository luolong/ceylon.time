Integer dayOfYear(Boolean isLeapYear, MonthOfYear monthOfYear, Integer dayOfMonth){
	variable Integer days := dayOfMonth;
	variable MonthOfYear m := january;
	while (m < monthOfYear) {
		days += m.numberOfDays(isLeapYear);
		m++;
	}
	return days;
}

shared class LocalDate(year, monthOfYear, dayOfMonth)
	satisfies Comparable<LocalDate> {
	
	doc "Year of the date"
	shared Integer year;
	
	doc "Month of the year"
	shared MonthOfYear monthOfYear;
	
	doc "Day of month. 
	     This represent number of days of month.
	     Depending on the year and month, this value can ranges between 1..31"
	shared Integer dayOfMonth;
	
	doc "Day of epoch"
	shared Integer dayOfEpoch {
		//FIXME: we need to be more precise 
		return 365 * year + dayOfYear(isLeapYear(), monthOfYear, dayOfMonth);
	}
	
	doc "Returns true if the year represented by this date is a leap year"
	shared Boolean isLeapYear() {
		if (year % 400 == 0) {
			return true;
		}
		
		if (year % 100 == 0) {
			 return false;
		}
		
		if (year % 4 == 0) {
			return true;
		}
		
		return false;
	}
	
	doc "Compares two local dates"
	shared actual Comparison compare(LocalDate other) {
		return dayOfEpoch <=> other.dayOfEpoch;
	}
}

shared class LocalTime()
	satisfies Comparable<LocalTime>{
	
	shared actual Comparison compare(LocalTime other) {
		return equal;
	}
}