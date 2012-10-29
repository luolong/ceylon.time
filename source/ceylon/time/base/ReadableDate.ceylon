doc "An interface of all date like objects. 
     That is, this represents all objects that share date fields."
shared interface ReadableDate {

	doc "The year of the date"
	shared formal Integer year;
	
	doc "Month of the year field."
	shared formal MonthOfYear month;
	
	doc "Day of month field." 
	shared formal Integer dayOfMonth;
		
	doc "True if this is a date in a leap year."
	shared formal Boolean leapYear;
	
	doc "Day of the year."
	shared formal Integer dayOfYear;
	
	doc "number of calendar days since ERA"
	shared formal Integer dayOfEra;
	
	doc "Week number of the year."
	shared formal Integer weekOfYear;
	
	doc "Day of the week."
	shared formal DayOfWeek dayOfWeek;

} 