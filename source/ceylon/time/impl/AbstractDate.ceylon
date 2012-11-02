import ceylon.time { Date }
import ceylon.time.base { MonthOfYear, getMonthOfYear = monthOfYear }
import ceylon.time.impl { yearField = year, monthField = monthOfYear, dayOfMonthField = dayOfMonth } 
shared abstract class AbstractDate( Integer yearParameter, Integer|MonthOfYear monthParameter, Integer dateParameter )
	satisfies Date {

	if ( is GregorianDate this ) {
		yearField.checkValidValue( yearParameter );
		
		value m = getMonthOfYear(monthParameter);
		monthField.checkValidValue( m.integer );
		
        dayOfMonthField.checkValidValue(dateParameter);
	}
	
	shared actual Comparison compare(Date other) {
		return dayOfEra <=> other.dayOfEra;
	}
	
	shared actual Integer distanceFrom(Date other) {
		return dayOfEra.distanceFrom(other.dayOfEra);
	}
}