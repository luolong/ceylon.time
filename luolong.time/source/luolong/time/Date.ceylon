import ceylon.math.decimal { Decimal }
doc "Returns true if the year represented by this date is a leap year"
Boolean isLeapYear(Integer year) { 
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

doc "An interface for date objects in the ISO-8601 calendar system,
	
	A date is often viewed as triple of year-month-day values. 
	This interface also defines access to other date fields such as 
	day-of-year, day-of-week and week-of-year."
shared interface Date {
	
	doc "The year field."
	shared formal Integer year;
	
	doc "Month of the year field."
	shared formal MonthOfYear month;
	
	doc "Day of month field."
	shared formal Integer day;
	
	// Calculated fields
	
	doc "True if this is a date in a leap year."
	shared default Boolean leapYear {
		return isLeapYear( year );
	}
	
	doc "Day of the year."
	shared default Integer dayOfYear{
		variable Integer doy := 0;
		variable MonthOfYear m := january;
		while(m < month){
			doy += m.numberOfDays(leapYear);
			m := m.successor;
		}
		return doy + day;
	}
	
	doc "Week number of the year."
	shared default Integer weekOfYear{
		return 0;
	}
	
	doc "Day of the week."
	shared default DayOfWeek dayOfWeek{
		value dow = BabwaniGregorian(year, month.integer, day).w;
		return dayOfWeek(dow);
	}
}

doc "Implementation of the Babwani's Congruence for calculating day-of-week."
abstract class BabwaniCongruence(Integer year, Integer month, Integer day) {
	shared Integer y = year % 100;
	shared Integer c = year / 100;
	shared Integer m = month;
	shared Integer d = day;
	
	shared formal Integer s;
	shared formal Integer h(Integer c);

	shared Integer g(Integer y){
		value g = (5.0 * y / 4.0); 
		return g.wholePart.integer;
	}
	
	Integer[] table = {5, 0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3};
	
	Integer l(Integer m){
		// Dec, Jan, Feb, ..., Nov
		if (exists l = table[m % 12]){
			// this value should always exist
			value leap = {0, 6, -1}.item(m % 12) else 0;
			return isLeapYear(year) then l + leap else l;
		}
		
		// Something just went terribly wrong?
		throw;
	}
	
	shared Integer f(Integer m){
		value f = 3.0
		        + (2.0 - l(m)) * (0.5 + 1.0/m).wholePart
		        + (5.0 * m + (m / 9.0).wholePart) / 2.0;
		return f.wholePart.integer; 
	}
	
	shared default Integer w {
		return (d + f(m) + g(y) + h(c) + s) % 7;
	}
}

class BabwaniJulian(Integer year, Integer month, Integer day)
		extends BabwaniCongruence(year, month, day){
	shared actual Integer s = -2;
	shared actual Integer h(Integer c){
		return -c;
	}
}

class BabwaniGregorian(Integer year, Integer month, Integer day)
		extends BabwaniCongruence(year, month, day){
	shared actual Integer s = 0;
	shared actual Integer h(Integer c){
		return -2 * c + (c / 4.0).wholePart.integer;
	}		
}