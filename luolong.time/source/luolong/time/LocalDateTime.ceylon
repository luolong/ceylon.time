shared class LocalDateTime(year, month, day, hour=0, minute=0, second=0, millisecond=0) {

	doc "Year of the local date."
	shared Integer year;

	doc "Month of the year."
	shared MonthOfYear month;

	doc "Day of month (values 1 to 31)"
	shared Integer day;
	
	doc "Hour of the day (values 1 to 24)"
	shared Integer hour;
		
	doc "Minute of an hour (values 0 to 59)"
	shared Integer minute;
	
	doc "Number of seconds since last full hour (values 0 to 59)"
	shared Integer second;
	
	doc "Number of milliseconds since last full second (values of 0 to )"
	shared Integer millisecond;
	
	shared LocalDate localDate {
		//FIXME: Return actual value
		return bottom;
	}
	 
	//TODO: Needs implementation

}