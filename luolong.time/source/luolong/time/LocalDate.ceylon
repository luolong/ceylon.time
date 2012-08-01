import luolong.time.period { Period }
doc "Returns current date "
shared LocalDate today(Clock? clock = null){
	Instant instant = now(clock);
	return instant.asLocalDateTime().localDate;
}

Integer dayOfYear(Boolean isLeapYear, MonthOfYear monthOfYear, Integer dayOfMonth){
	variable Integer days := dayOfMonth;
	variable MonthOfYear m := january;
	while (m < monthOfYear) {
		days += m.numberOfDays(isLeapYear);
		m++;
	}
	return days;
}

shared class LocalDate(year, month, day)
	satisfies Date & Comparable<LocalDate> {
	
	doc "Year of the date"
	shared actual Integer year;
	
	doc "Month of the year"
	shared actual MonthOfYear month;
	
	doc "Day of month. 
	     This represent number of days of month.
	     Depending on the year and month, this value can ranges between 1..31"
	shared actual Integer day;
	
	doc "Compares two local dates"
	shared actual Comparison compare(LocalDate other) {
		return dayOfEpoch <=> other.dayOfEpoch;
	}
	
	doc "Adds a specified period to this local date."
	shared LocalDate plus(Period period) {
		//TODO: Discard period with nonzero time fields
		
		variable Integer year := this.year + period.years + period.months / 12;
		variable MonthOfYear month := this.monthOfYear.shift(period.months);
		variable Integer days := this.dayOfMonth + period.days;
		
		variable Boolean leapYear := isLeapYear(year);
		while (days < 1) {
			month := month.predecessor;
			if (month == december){
				year -= 1;
				leapYear := isLeapYear(year);
			}
			days += month.numberOfDays(leapYear);
		}
		
		while(days > month.numberOfDays(leapYear)) {
			days -= month.numberOfDays(leapYear);
			month := month.successor;
			if (month == january){
				year += 1;
				leapYear := isLeapYear(year);
			} 
		}
		
		return LocalDate(year, month, days);
	}
	
	doc "Converts this local date to an instant"
	shared Instant instant(/*Instant|Integer? offset = null*/){
		value instant = 0;
		/*
		if (is Integer offset){
			return Instant(instant + offset);
		}
		if (is TimeZone zone = offset) {
			return Instant(instant + zone.offset);
		} 
		*/
		return Instant(instant);
	}
	
}