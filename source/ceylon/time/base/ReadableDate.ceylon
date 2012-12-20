import ceylon.time { Date, Time, DateTime }
import ceylon.time.timezone { ZoneDateTime }

doc "A common interface of all date like objects.

     This interface is common to all data types that
     either partially or fully represent information 
     that can be interpreted as _date_."
by ('Diego Coronel', 'Roland Tepp')
see (Date, Time, DateTime, ZoneDateTime)
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

    doc "number of calendar days since ERA."
    shared formal Integer dayOfEra;

    doc "Week number of the year."
    shared formal Integer weekOfYear;

    doc "Day of the week."
    shared formal DayOfWeek dayOfWeek;

} 