import ceylon.time { Date, Time, DateTime }
import ceylon.time.timezone { ZoneDateTime }

doc "A common interface of all date like objects.
     
     This interface is common to all data types that
     either partially or fully represent information 
     that can be interpreted as _date_."
by ("Diego Coronel", "Roland Tepp")
see (Date, Time, DateTime, ZoneDateTime)
shared interface ReadableDate {

    doc "The year of the date"
    shared formal Integer year;

    doc "Month of the year value of the date"
    shared formal Month month;

    doc "Day of month value of the date" 
    shared formal Integer day;

    doc "Day of the week."
    shared formal DayOfWeek dayOfWeek;

    doc "Number of the week of the date"
    shared formal Integer weekOfYear;

    doc "Number of the day in year"
    shared formal Integer dayOfYear;

    doc "Number of calendar days since ERA."
    shared formal Integer dayOfEra;

    doc "True if the year of the date is a leap year."
    shared formal Boolean leapYear;

}