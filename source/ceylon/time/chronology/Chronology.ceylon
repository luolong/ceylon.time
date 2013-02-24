import ceylon.time.base { days, milliseconds, monthOf, DateTimeException, hours, minutes, seconds }
import ceylon.time.math { floor, fdiv=floorDiv, mod=floorMod }

doc "Converts _Rata Die_ day number to a fixed date value.
     
     _Rata Die_ is fixed at Monday, January 1st, 1. (Gregorian)."
shared Integer rd( Integer t ) {
    value epoch = 0; // origin of all calculations
    return t - epoch;
}

doc "Represents unix date"
shared [Integer,Integer,Integer] unixEpoch = [1970,1,1];

doc "Generic base interface of a _calendar system_.
     Chronology serves as a computational backend to 
     a Date representation of the same calendar system."
shared interface Chronology<Fields>
       given Fields satisfies Anything[] {
    
    doc "Epoch is the offset of the _fixed date_ day number that defines 
         the beginning of the calendar."
    shared formal Integer epoch;

    doc "Converts date tuple of this calendar system to an equivalent _fixed date_
         representation of the "
    shared formal Integer fixedFrom(Fields date);
    
    doc "Converts a _fixed day_ number to a calendar date tuple"
    shared formal Fields dateFrom(Integer fixed);
    
}

doc "An interface for calendar system that defines leap year rules.
     
     *Note:* This interface is meant to convey a Calendar that has some sort of leap year syntax"
shared interface LeapYear<Self, Fields> of Self
       given Self satisfies Chronology<Fields>
       given Fields satisfies Anything[] {
    
    doc "Returns true if the specified year is a leap year according to the leap year rules of the"
    shared formal Boolean leapYear( Integer leapYear );
    
}

doc "Base class for a gregorian calendar chronology."
abstract shared class GregorianCalendar() of gregorian
         satisfies Chronology<[Integer, Integer, Integer]>
                 & LeapYear<GregorianCalendar, [Integer, Integer, Integer]> {

    doc "Milliseconds elapsed from unix epoch"
    shared formal Integer millisFrom([Integer, Integer, Integer] date);

    doc "Throw an exception when its not valid day"
    shared formal void checkDate([Integer, Integer, Integer] date);
    
}

doc "Represents the implementation of all calculations for
     the rules based on Gregorian Calendar"
shared object gregorian extends GregorianCalendar() {
    
    doc "Epoch of the gregorian calendar"
    shared actual Integer epoch = rd(1);
    
    shared Integer january = 1;
    shared Integer february = 2;
    shared Integer march = 3;
    shared Integer april = 4;
    shared Integer may = 5;
    shared Integer june = 6;
    shared Integer july = 7;
    shared Integer august = 8;
    shared Integer september = 9;
    shared Integer october = 10;
    shared Integer november = 11;
    shared Integer december = 12;
    
    doc "Gregorian leap year rule states that every fourth year
         is a leap year except cenury years not divisible by 400."
    shared actual Boolean leapYear(Integer year) {
        return (year % 100 == 0) then year % 400 == 0
                                 else year % 4 == 0;
    }
    
    Integer fixed(Integer year, Integer month, Integer day) {
        return epoch - 1 + 365 * (year - 1) + floor((year - 1) / 4.0)
               - floor((year - 1) / 100.0) + floor((year - 1) / 400.0)
               + floor((367 * month - 362) / 12.0)
               + ((month > 2) then (leapYear(year) then -1 else -2) else 0)
               + day;
    }
    
    shared actual Integer fixedFrom([Integer, Integer, Integer] date) {
        checkDate(date);
        return fixed { 
            year = date[0]; 
            month = date[1]; 
            day = date[2]; 
        };
    }

    shared actual void checkDate([Integer, Integer, Integer] date) {
        value monthConverted = monthOf(date[1]);
        value maxMonthDays = monthConverted.numberOfDays(leapYear(date[0]));
        if ( date[2] <= 0 || date[2] > maxMonthDays ) {
            throw DateTimeException("Date for ``monthConverted.string`` should be between 1 and ``maxMonthDays`` and it was ``date[2]``");
        }
    }

    doc "Milliseconds from unix date"
    shared actual Integer millisFrom([Integer, Integer, Integer] date) {
        return (fixedFrom(date) - fixedFrom(unixEpoch)) * milliseconds.perDay;
    }
    
    shared Integer newYear(Integer year){
        return fixed(year, january, 1);
    }
    
    shared Integer yearEnd(Integer year){
        return fixed(year, december, 31);
    }
    
    shared Integer yearFrom(Integer fixed) {
        value d0 = fixed - epoch;
        value n400 = fdiv(d0, days.in400Years);
        value d1 = mod(d0, days.in400Years);
        value n100 = fdiv(d1, days.in100Years);
        value d2 = mod(d1, days.in100Years);
        value n4 = fdiv(d2, days.inFourYears);
        value d3 = mod(d2, days.inFourYears);
        value n1 = fdiv(d3, days.perYear());
        value year = 400 * n400 + 100 * n100 + 4 * n4 + n1;
        return (n100 == 4 || n1 == 4) then year else year + 1;
    }
    
    shared actual [Integer, Integer, Integer] dateFrom(Integer date) {
        value year = yearFrom(date);
        value priorDays = date - newYear(year);
        value correction = (date < fixed(year, march, 1)) 
                then 0 else (leapYear(year) then 1 else 2);
        value month = fdiv(12 * (priorDays + correction) + 373, 367);
        value day = 1 + date - fixed(year, month, 1);
        return [year, month, day];
    }
    
    shared Integer monthFrom(Integer date){
        return dateFrom(date)[1];
    }
    
    shared Integer dayFrom(Integer date){
        return dateFrom(date)[2];
    }
    
    shared Integer dayOfWeekFrom(Integer date) {
        return mod(date, 7);
    }
    
}

shared object time {
    shared void checkHour( Integer hour ) {
        if ( hour < 0 || hour >= hours.perDay ) {
            throw DateTimeException("Hour should be between 0 and 23 but it was ``hour``");
        }
    }
    shared void checkMinute( Integer minute ) {
        if ( minute < 0 || minute >= minutes.perHour ) {
            throw DateTimeException("Minute should be between 0 and 59 but it was ``minute``");
        }
    }
    shared void checkSecond( Integer second ) {
        if ( second < 0 || second >= seconds.perMinute ) {
            throw DateTimeException("Second should be between 0 and 59 but it was ``second``");
        }
    }
    shared void checkMillisecond( Integer milli ) {
        if ( milli < 0 || milli >= milliseconds.perSecond ) {
            throw DateTimeException("Millisecond should be between 0 and 999 but it was ``milli``");
        }
    }
    shared void checkTime( Integer hour = 0, Integer minute = 0, Integer second = 0, Integer milli = 0) {
        checkHour(hour);
        checkMinute(minute);
        checkSecond(second);
        checkMillisecond(milli);
    }    
}