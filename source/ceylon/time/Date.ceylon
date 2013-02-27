import ceylon.time.base { ReadableDate, Month, monthOf, DateBehavior, ReadableDatePeriod }
import ceylon.time.chronology { gregorian }
import ceylon.time.impl { gregorianDate, julianDate }
import ceylon.time.timezone { TimeZone }

doc "An interface for date objects in the ISO-8601 calendar system.
     
     A date is often viewed as triple of year-month-day values. 
     This interface also defines access to other date fields such as 
     day-of-year, day-of-week and week-of-year."
shared interface Date
       satisfies ReadableDate & DateBehavior<Date>
               & Ordinal<Date> & Comparable<Date> {
     
    doc "Returns a copy of this period with the specified period added."
    shared formal Date plus( ReadableDatePeriod period );

    doc "Returns a copy of this period with the specified period subtracted."
    shared formal Date minus( ReadableDatePeriod period );

}

doc "Returns current date according to the provided system clock and time zone."
shared Date today(Clock clock = systemTime, TimeZone? zone = null){
    return clock.instant().date(zone);
}

/*
doc "parses a Date from ISO date formatted string (YYYY-MM-DD)"
shared Date parseDate(String string){
    return nothing;
}
*/

doc "Returns a date based on the specified year, month and day-ofMonth values"
shared Date date(Integer? year, Integer|Month? month, Integer? day){
    if (exists year, exists month, exists day) {
        value m = monthOf(month);
        //if (year > 1582 || (year == 1582 && m <= march)){
        //	return JulianDate()
        //}
        return gregorianDate(year, m, day);
    }
    
    value _today = now().date();
    value yyyy = year else _today.year;
    value moy = monthOf(month else _today.month);
    value doy = day else _today.day;
    return gregorianDate { 
        year = yyyy;
        month = moy; 
        day = min{ doy, moy.numberOfDays(gregorian.leapYear(yyyy)) };
    };
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

