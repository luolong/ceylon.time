shared interface DateBehavior<Element> 
					given Element satisfies DateBehavior<Element>{

	doc "Returns a copy of this period with the specified amount of years."
	shared formal Element withYears(Integer years);
	
	doc "Returns a copy of this period with the specified amount of months."
	shared formal Element withMonths(Integer months);
	
	doc "Returns a copy of this period with the specified amount of days."
	shared formal Element withDays(Integer days);

	doc "Returns a copy of this period with the specified number of years added."
	shared formal Element plusYears(Integer years);
	
	doc "Returns a copy of this period with the specified number of months added."
	shared formal Element plusMonths(Integer months);
	
	doc "Returns a copy of this period with the specified number of days added."
	shared formal Element plusDays(Integer days);
	
	doc "Returns a copy of this period with the specified number of years subtracted."
	shared formal Element minusYears(Integer years);
	
	doc "Returns a copy of this period with the specified number of months subtracted."
	shared formal Element minusMonths(Integer months);
	
	doc "Returns a copy of this period with the specified number of days subtracted."
	shared formal Element minusDays(Integer days);
	
	doc "Returns a new period that is a sum of the two periods."
	shared formal Element plus(Element other);

	doc "Returns a copy of this period with all amounts normalized to the 
		standard ranges for date-time fields.
		
		Two normalizations occur, one for years and months, and one for
		hours, minutes, seconds and nanoseconds.
		
		Days are not normalized, as a day may vary in length at daylight savings cutover.
		Neither is days normalized into months, as number of days per month varies from 
		month to another and depending on the leap year.
		"
	shared formal Element normalized();
		
}