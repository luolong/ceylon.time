import ceylon.time.math{ mod, floor, fdiv }
import ceylon.time.base { days }

doc "Converts _Rata Die_ day number to a fixed date value.
     
     _Rata Die_ is fixed at Monday, January 1st, 1. (Gregorian)."
shared Integer rd( Integer t ) {
    value epoch = 0; // origin of all calculations
    return t - epoch;
}

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
    shared formal Integer getFixed(Fields date);
    
    doc "Converts a _fixed day_ number to a calendar date tuple"
    shared formal Fields getDate(Integer fixed);
}

doc "An interface for calendar system that defines leap year rules.
     
     *Note:* This interface is meant to convey a Calendar that has some sort of leap year syntax"
shared interface LeapYear<Self, Fields> of Self
       given Self satisfies Chronology<Fields>
       given Fields satisfies Anything[] {
    
    doc "Returns true if the specified year is a leap year according to the leap year rules of the"
    shared formal Boolean leapYear( Integer leapYear );
    
}

shared object fixed satisfies Chronology<[Integer]> {
    
    shared actual Integer epoch = rd(1);
    
    shared actual Integer getFixed([Integer] date) {
        return date[0];
    }
    
    shared actual [Integer] getDate(Integer fixed) {
        return [fixed];
    }
    
}

doc "Base class for a gregorian calendar chronology."
abstract shared class GregorianCalendar() of gregorian
         satisfies Chronology<[Integer, Integer, Integer]>
                 & LeapYear<GregorianCalendar, [Integer, Integer, Integer]> {
    
}

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
    
    Integer fixedFrom(Integer year, Integer month, Integer day) {
        return epoch - 1 + 365 * (year - 1) + floor((year - 1) / 4.0)
               - floor((year - 1) / 100.0) + floor((year - 1) / 400.0)
               + floor((367 * month - 362) / 12.0)
               + ((month > 2) then (leapYear(year) then -1 else -2) else 0)
               + day;
    }
    
    shared actual Integer getFixed([Integer, Integer, Integer] date) {
        return fixedFrom { 
            year = date[0]; 
            month = date[1]; 
            day = date[2]; 
        };
    }
    
    shared Integer newYear(Integer year){
        return fixedFrom(year, january, 1);
    }
    
    shared Integer yearEnd(Integer year){
        return fixedFrom(year, december, 31);
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
    
    shared actual [Integer, Integer, Integer] getDate(Integer date) {
        value year = yearFrom(date);
        value priorDays = date - newYear(year);
        value correction = (date < fixedFrom(year, march, 1)) 
                then 0 else (leapYear(year) then 1 else 2);
        value month = fdiv(12 * (priorDays + correction) + 373, days.perYear());
        value day = 1 + date - fixedFrom(year, month, 1);
        return [year, month, day];
    }
    
    shared Integer monthFrom(Integer date){
        return getDate(date)[1];
    }
    
    shared Integer dayFrom(Integer date){
        return getDate(date)[2];
    }
    
    shared Integer weekdayFrom(Integer date) {
        return mod(date, 7);
    }
    
}