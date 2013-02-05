import ceylon.time.math{ mod, floor }

doc "Converts _Rata Die_ day number to a fixed date value.
     
     _Rata Die_ is fixed at Monday, January 1st, 1. (Gregorian)."
shared Integer rd( Integer t ) {
    value epoch = 0; // origin of all calculations
    return t - epoch;
}

doc "Generic base interface of a calendar system.
     Implementations of the Calendar define two main functions:
     
     - [[fixed]] convert tuple of the calendar date representation to a _fixed date_ value
     - [[date]] converts _fixed date_ value to a calendar tuple of the calendar system.
     "
shared interface Calendar<Fields>
       given Fields satisfies Anything[] {
    
    doc "Epoch is the offset of the _fixed date_ day number that defines 
         the beginning of the calendar."
    shared formal Integer epoch;
    
    doc "Converts date tuple of this calendar system to an equivalent _fixed date_
         representation of the "
    shared formal Integer fixed(Fields date);
    
    shared formal Fields date(Integer fixed);
}

doc "An interface for calendar system that defines leap year rules.
     
     *Note:* This interface is meant to convey a Calendar that has some sort of leap year syntax"
shared interface LeapYearRule {
    
    doc "Returns true if the specified year is a leap year according to the leap year rules of the"
    shared formal Boolean leapYear( Integer leapYear );
    
}



shared object gregorian satisfies Calendar<[Integer, Integer, Integer]> & LeapYearRule {
    
    doc "Epoch of the gregorian calendar"
    shared actual Integer epoch = rd(1);

    doc "Gregorian leap year rule states that every fourth year
         is a leap year except cenury years not divisible by 400."
    shared actual Boolean leapYear(Integer year) {
        return (year % 100 == 0) then year % 400 == 0
                                 else year % 4 == 0;
    }
    
    shared actual Integer fixed([Integer, Integer, Integer] date) {
        value year = date[0];
        value month = date[1];
        value day = date[2];
        
        return epoch - 1 + 365 * (year - 1) + floor((year - 1) / 4.0)
               - floor((year - 1) / 100.0) + floor((year - 1) / 400.0)
               + floor((367 * month - 362) / 12.0)
               + ((month > 2) then (leapYear(year) then -1 else -2) else 0)
               + day;
    }
    
    shared actual [Integer, Integer, Integer] date(Integer fixed) {
        return nothing;
    }
}