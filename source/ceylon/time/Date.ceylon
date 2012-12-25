import ceylon.time.impl { GregorianDate }
import ceylon.time.base { ReadableDate, MonthOfYear, monthOfYear, DateBehavior }
import ceylon.time.field { days, years, monthsField = months }

doc "An interface for date objects in the ISO-8601 calendar system.

     A date is often viewed as triple of year-month-day values. 
     This interface also defines access to other date fields such as 
     day-of-year, day-of-week and week-of-year."
shared interface Date
       satisfies ReadableDate & DateBehavior<Date>
               & Ordinal<Date> & Comparable<Date> { }

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
    return GregorianDate(gregorian(year, m.integer, date));
} 

doc "Calculates the number of days according to julian calendar rules"
Integer j(Integer yyyy, Integer mm, Integer d) {
    value m = (mm + 9) % 12;
    value y = yyyy - m/10;
    return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}

doc "Calculates the number of days according to gregorian calendar rules"
shared Integer gregorian(Integer yyyy, Integer mm, Integer d) {

    years.checkValidValue( yyyy );

    value mo = monthOfYear(mm);
    monthsField.checkValidValue( mo.integer );
	
    days.checkValidValue(d);

    value m = (mm + 9) % 12;
    value y = yyyy - m/10;
    return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}