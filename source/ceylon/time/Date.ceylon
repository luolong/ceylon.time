import ceylon.time.base { ReadableDate, Month, monthOf, DateBehavior }
import ceylon.time.impl { gregorianDate, julianDate }
import ceylon.time.timezone { TimeZone }

doc "An interface for date objects in the ISO-8601 calendar system.

     A date is often viewed as triple of year-month-day values. 
     This interface also defines access to other date fields such as 
     day-of-year, day-of-week and week-of-year."
shared interface Date
       satisfies ReadableDate & DateBehavior<Date>
               & Ordinal<Date> & Comparable<Date> { }

doc "Returns current date according to the provided system clock and time zone."
shared Date today(Clock clock = systemTime, TimeZone? zone = null){
    return clock.instant().date(zone);
}

doc "parses a Date from ISO date formatted string (YYYY-MM-DD)"
shared Date parseDate(String string){
    return bottom;
}

doc "Returns a date based on the specified year, month and day-ofMonth values"
shared Date date(Integer year, Integer|Month month, Integer date){
    value m = monthOf(month);
    //if (year > 1582 || (year == 1582 && m <= march)){
    //	return JulianDate()
    //}
    return gregorian(year, m, date);
} 

doc "Returns a gregorian calendar date according to the specified year, month and date values"
shared Date gregorian(year, month, date){
        doc "Year number of the date"
        Integer year;
        
        doc "Month of the year"
        Integer|Month month; 
        
        doc "Date of month"
        Integer date;
        
    return gregorianDate( year, monthOf(month).integer, date );
}


doc "Returns a julian calendar date according to the specified year, month and date values"
shared Date julian(year, month, date){
        doc "Year number of the calendar date"
        Integer year;
        
        doc "Month of the year"
        Integer|Month month; 
        
        doc "Date of month"
        Integer date;
        
    return julianDate(year, monthOf(month).integer, date);
}

doc "Calculates the number of days according to julian calendar rules"
Integer j(Integer yyyy, Integer mm, Integer d) {
    value m = (mm + 9) % 12;
    value y = yyyy - m/10;
    return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}
