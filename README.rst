
Ceylon Date/Time library
========================


This is a draft proposal for a standard Date and Time library for Ceylon language.

Standard Date/Time library for Ceylon language should provida all necessary data types and operation on thosd that are most often needed for business line applications and database interoperability. 

As most business line application mostly dal with Gregorian calendar, the data types in this library will also be modeled after Gregorian calendar. 

This business needs orientation is also basis for omitting such features as leap seconds, limiting the precision of time related operations to a length of a millisecond, no initial support for alternate calendaring systems, etc.

Main data types are followig:
- Instant
- LocalDate, LocalTime, LocalDateTime
- ZoneDateTime

Supporting data types:
- TimeZone
- Period, Duration
- MonthOfYear, DayOfWeek
- Clock
- etc...


Instant
=======

Instant is a singular instant in time, measured in milliseconds since fixed moment in time (called epoch).

An Instant contains no timezone information and represents an absolute unambiguous value on a continuous scale of time.


Creation of an Instant
----------------------

By default an instant is created by providing a number of milliseconds since epoch to the constructor defining the instant.

Another means of creating an instant is by using a function called `now()`, which will return current instant in time. The function takes an optional argument of type `Clock` that is responsible for providing the number of milliseconds since epoch. By default the SystemClock is used that returns number of milliseconds from underlying platform.

Also, most other date and time types can be converted to an Instant.

Examples::
    shared Instant now1 = Instant(process.milliseconds);
    shared Instant now2 = now();


Operations on Instant
---------------------

- Difference of two Instants returns a Duration.
- Adding and subtracting a Duration to/from an Instant returns another Instant.
- Comparing two Instants returns the result of a Comparison.
- Converting an instant to a Date, Time, DateTime or ZoneDateTime.
- Iterating over a range of Instants
- etc...

Examples::
    shared Instant start = now();
    // ... some expensive operation
    shared Instant end = now();
    
    Duration duration = end.durationFrom(start);
    for (Instant i in start.for(duration)){
        ....
    }
    
    for (Instant i2 in start .. end){
    	...
    }
    

Date
====

Represents a date in a Gregorian calendar system with a precision of one day.

Date does not have time zone or locale specific information attached to it.

Implementation detail:
    Current implementation of Date is encoded as a triple of year, monthOfYear and dayOfMonth values.
    Alternate implementation would encode a date as a number of days since a well known date, known as "epoch".
    This would allow compiling Date as 'value objects', thus opening it up to the performance improvements this entails.


Creation of a Date
------------------

Date today()
   Creates an instance of a date from current instant, similar to the function now() for an Instant.

Date date(Integer year, MonthOfYear month, Integer day=1)
    Creates new instance of Date based on the provided triple of the values, validating the input values and (in future) returning a Julian or Gregorian calendar date depending on the provided date value and current locale.

Date gregorian(Integer? year=null, MonthOfYear? month=null, Integer? day=null)
    Creates new instance of a date of Gregorian calendar.

Date julian(Integer? year=null, MonthOfYear? month=null, Integer? day=null)
    Creates new instance of a date of Julian calendar.
    (low priority - support for Julian and other calendar systems can be postponed until actual need arises)


Examples::
    shared Date date = date(2012, july, 29);
    shared Date today = today();


Operations on Date
------------------

- Difference of two dates returns a Period.
- Adding and subtracting a Period (with precision of a day)
- Converting to DateTime, ZoneDateTime, etc.
- Iterating over range of dates by a specific interval

...

