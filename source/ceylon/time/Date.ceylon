doc "An interface of all date like objects. 
     That is, this represents all objects that share date fields."
shared interface DateLike{
	
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
	
	doc "Week number of the year."
	shared formal Integer weekOfYear;
	
	doc "Day of the week."
	shared formal DayOfWeek dayOfWeek;
	
}

doc "An interface for date objects in the ISO-8601 calendar system,
	
	A date is often viewed as triple of year-month-day values. 
	This interface also defines access to other date fields such as 
	day-of-year, day-of-week and week-of-year."
shared interface Date
		satisfies DateLike & Ordinal<Date> & Comparable<Date>{
		
	doc "number of calendar days since ERA"
	shared formal Integer dayOfEra;
	
}

abstract class Algorithm() {
	shared formal Integer year();
	shared formal Integer month();
	shared formal Integer day();
	shared formal Boolean leapYear();
}

abstract class AbstractDate(dayOfEra)
	satisfies Date {
	
	shared actual Integer dayOfEra;
	
	shared actual Comparison compare(Date other) {
		return dayOfEra <=> other.dayOfEra;
	}
	
	shared actual Integer distanceFrom(Date other) {
		return dayOfEra.distanceFrom(other.dayOfEra);
	}
}

doc "Default implementation of a gregorian calendar"
class GregorianDate(Integer d) 
	  extends AbstractDate(d){
		
	// Compute date values from the provided date
	variable Integer y := (10000*d + 14780)/3652425;
	variable Integer ddd := d - (365*y + y/4 - y/100 + y/400);
	if (ddd < 0) {
		y -= 1;
		ddd := d - (365*y + y/4 - y/100 + y/400);
	}
	
	value mi = (100*ddd + 52)/3060;
	value mm = (mi + 2)%12 + 1;
	y += (mi + 2)/12;
	value dd = ddd - (mi*306 + 5)/10 + 1;
	
	shared actual Integer dayOfMonth = dd;
	shared actual MonthOfYear month = monthOfYear(mm);
	shared actual Integer year = y;
	
	shared actual Integer dayOfYear = bottom;
	shared actual Integer weekOfYear = bottom;
	shared actual DayOfWeek dayOfWeek = bottom;
	
	doc "True, if this date is a leap year according to gregorian clendar leap year rules."
	shared actual Boolean leapYear {
		if (year % 400 == 0){
			return true;
		}
		
		if (year % 100 == 0){
			return false;
		}
		
		if (year % 4 == 0){
			return true;
		}
		
		return false;
	}
	
	shared actual GregorianDate predecessor {
		return GregorianDate( dayOfEra - 1 );
	}
	
	shared actual GregorianDate successor {
		return GregorianDate( dayOfEra + 1 );
	}	
}  

/*
class JulianDate(Integer dayOfEra) 
		extends DateImpl(dayOfEra) {
	
	shared actual Algorithm calculated = Julian(dayofEra);
}
*/

doc "parses a Date from ISO date formatted string (YYYY-MM-DD)"
shared Date parseDate(String string){
	return bottom;
}


doc "Returns a date based on the specified year, month and day-ofMonth values"
shared Date date(Integer year, Integer|MonthOfYear month, Integer date){
	value m = monthOfYear(month);
	//if (year > 1582 || (year == 1582 && m <= march)){
	//	return JulianDate()
	//}
	return GregorianDate(g(year, m.integer, date));
}

doc "Calculates the number of days according to gregorian calendar rules"
Integer g(Integer yyyy, Integer mm, Integer d) {
	value m = (mm + 9) % 12;
	value y = yyyy - m/10;
	return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}

doc "Calculates the number of days according to julian calendar rules"
Integer j(Integer yyyy, Integer mm, Integer d) {
	value m = (mm + 9) % 12;
	value y = yyyy - m/10;
	return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}
