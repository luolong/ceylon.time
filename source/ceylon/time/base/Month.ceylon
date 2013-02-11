import ceylon.time.math { mod, fdiv }
import ceylon.time.chronology { gregorian }

doc "A month in a Gregorian or Julian calendar system."
shared abstract class Month(integer)
       of january | february | march | april | may | june | july | august | september | october | november | december
       satisfies Ordinal<Month> & Comparable<Month>{

        doc "Ordinal number of the month of year.
             Where:
                january  = 1
                february = 2
                ...
                december = 12"
        shared Integer integer;

    doc "Returns number of days in this month"
    shared default Integer numberOfDays(Boolean leapYear = false) {
        switch(this)
        case (february) { return leapYear then 29 else 28; }
        case (april,june,september,november) { return 30; } 
        case (january,march,may,july,august,october,december) { return 31; }
    }

    doc "Returns the _day of year_ value for first of this month"
    shared default Integer fisrtDayOfYear(Boolean leapYear = false){
        assert(exists day = firstDayOfMonth[this.integer-1]);
        if (leapYear && this > february){
            return day + 1;
        }
        return day;
    }

    doc "Compares ordinal numbers of two instances of `Month`"
    shared actual Comparison compare(Month other) {
        return integer.compare(other.integer);
    }

    doc "Returns month of year that comes specified number of months after this month."
    shared Month plusMonths(Integer number) {
        return number == 0 then this else plus(number).month;
    }

    doc "Returns month of year that comes specified number of months before this month."
    shared Month minusMonths(Integer number) {
        return number == 0 then this else plus(-number).month;
    }

    doc "A result of adding or subtracting a month to another mont"
    shared class Overflow(month, years){
        doc "New month value"
        shared Month month;
        
        doc "Number of years overflowed by calculation"
        shared Integer years;
    }
    
    doc "Adds number of months to this month and returns the result of 
         as new month value and."
    shared Overflow plus(Integer number){
        value next = (integer - 1 + number);
        assert (exists month = months.all[mod(next, 12)]);
        if (0 <= next && next < 12) {
            return Overflow(month, 0);
        }
        
        Integer years = fdiv(next, 12);
        return Overflow(month, years); 
    }
}

doc "Table of _day of year_ values for the first day of each month"
Integer[] firstDayOfMonth = [1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335];

doc "Returns month of year specified by the input argument.

     If input is an Integer, this method returns a month according to the integer 
     value of the [[MonthOfYear]] (i.e. 1=[[january]], 2=[[february]], ... 12=[[december]])
     Any invalid values will throw an exception.

     If the imput value is a [[MonthOfYear]], the input value is returned as is."
shared Month monthOf(Integer|Month month){
    switch (month)
    case (is Month) { return month; }
    case (is Integer) {
        assert ( january.integer <= month && month <= december.integer );
        assert ( exists m = months.all[month-1] );
        return m;
    }
}

doc "January. The first month of a Gregorian/Julian calendar system."
shared object january extends Month(gregorian.january) {
    shared actual String string = "january";
    shared actual Month predecessor { return december; }  
    shared actual Month successor { return february; }
}

doc "February. The second month of a gregorian calendar system."
shared object february extends Month(gregorian.february) {
    shared actual String string = "february";
    shared actual Month predecessor { return january; }  
    shared actual Month successor { return march; }
}

doc "March. The third month of a gregorian calendar system."
shared object march extends Month(gregorian.march) {
    shared actual String string = "march";
    shared actual Month predecessor { return february; }  
    shared actual Month successor { return april; }
}

doc "April. The fourth month of a gregorian calendar system."
shared object april extends Month(gregorian.april) {
    shared actual String string = "april";
    shared actual Month predecessor { return march; }  
    shared actual Month successor { return may; }
}

doc "May. The fifth month of a gregorian calendar system."
shared object may extends Month(5) {
    shared actual String string = "may";
    shared actual Month predecessor { return april; }  
    shared actual Month successor { return june; }
}

doc "June. The sixth month of a gregorian calendar system."
shared object june extends Month(gregorian.june) {
    shared actual String string = "june";
    shared actual Month predecessor { return may; }
    shared actual Month successor { return july; }
}

doc "July. The seventh month of a gregorian calendar system."
shared object july extends Month(gregorian.july) {
    shared actual shared actual String string = "july";
    shared actual Month predecessor { return june; }  
    shared actual Month successor { return august; }
}

doc "August. The eigth month of a gregorian calendar system."
shared object august extends Month(gregorian.august) {
    shared actual shared actual String string = "august";
    shared actual Month predecessor { return july; }  
    shared actual Month successor { return september; }
}

doc "September. The nineth month of a gregorian calendar system."
shared object september extends Month(gregorian.september) {
    shared actual shared actual String string = "september";
    shared actual Month predecessor { return august; }  
    shared actual Month successor { return october; }
}

doc "October. The tenth month of a gregorian calendar system."
shared object october extends Month(gregorian.october) {
    shared actual shared actual String string = "october";
    shared actual Month predecessor { return september; }  
    shared actual Month successor { return november; }
}

doc "November. The eleventh month of a gregorian calendar system."
shared object november extends Month(gregorian.november) {
    shared actual shared actual String string = "november";
    shared actual Month predecessor { return october; }  
    shared actual Month successor { return december; }
}

doc "December. The twelveth (last) month of a gregorian calendar system."
shared object december extends Month(gregorian.december) {
    shared actual shared actual String string = "december";
    shared actual Month predecessor { return november; }  
    shared actual Month successor { return january; }
}
