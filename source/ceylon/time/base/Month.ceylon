

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
    shared default Integer numberOfDays(Boolean leapYear) {
        switch(this)
        case (february) { return leapYear then 29 else 28; }
        case (april,june,september,november) { return 30; } 
        case (january,march,may,july,august,october,december) { return 31; }
    }

    doc "Returns the _day of year_ value for first of this month"
    shared default Integer fisrtDayOfYear(Boolean leapYear){
        assert(exists day = firstDayOfMonth[this.integer-1]);
        if (leapYear && this > february){
            return day + 1;
        }
        return day;
    }

    doc "Compares ordinal numbers of two instances of `MonthOfYear`"
    shared actual Comparison compare(Month other) {
        return integer.compare(other.integer);
    }

    doc "Returns month of year that comes specified number of months after this month."
    shared Month plusMonths(Integer number) {
        value m = (integer + number) % 12;
        assert (exists month = months[m]); 
        return month;
    }

    doc "Returns month of year that comes specified number of months before this month."
    shared Month minusMonths(Integer number) {
        return plusMonths(12 - (number % 12));
    }

    doc "Returns number of months separating the other month from this one."
    shared actual Integer distanceFrom(Month other) {
        return integer.distanceFrom(other.integer);
    }
}

doc "Table of _day of year_ values for the first day of each month"
Integer[] firstDayOfMonth = {1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335};

doc "Enumeration of months of Gregorian/Julian calendar system from January to December"
shared Month[] months = {january, february, march, april, may, june, july, august, september, october, november, december};

doc "Returns month of year specified by the input argument.

     If input is an Integer, this method returns a month according to the integer 
     value of the [[MonthOfYear]] (i.e. 1=[[january]], 2=[[february]], ... 12=[[december]])
     Any invalid values will throw an exception.

     If the imput value is a [[MonthOfYear]], the input value is returned as is."
shared Month month(Integer|Month month){
    switch (month)
    case (is Month) { return month; }
    case (is Integer) {
        assert ( january.integer <= month && month <= december.integer );
        assert ( exists m = months[month-1] );
        return m;
    }
}

doc "January. The first month of a Gregorian/Julian calendar system."
shared object january extends Month(1) {
    shared actual String string = "january";
    shared actual Month predecessor { return december; }  
    shared actual Month successor { return february; }
}

doc "February. The second month of a gregorian calendar system."
shared object february extends Month(2) {
    shared actual String string = "february";
    shared actual Month predecessor { return january; }  
    shared actual Month successor { return march; }
}

doc "March. The third month of a gregorian calendar system."
shared object march extends Month(3) {
    shared actual String string = "march";
    shared actual Month predecessor { return february; }  
    shared actual Month successor { return april; }
}

doc "April. The fourth month of a gregorian calendar system."
shared object april extends Month(4) {
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
shared object june extends Month(6) {
    shared actual String string = "june";
    shared actual Month predecessor { return may; }
    shared actual Month successor { return july; }
}

doc "July. The seventh month of a gregorian calendar system."
shared object july extends Month(7) {
    shared actual shared actual String string = "july";
    shared actual Month predecessor { return june; }  
    shared actual Month successor { return august; }
}

doc "August. The eigth month of a gregorian calendar system."
shared object august extends Month(8) {
    shared actual shared actual String string = "august";
    shared actual Month predecessor { return july; }  
    shared actual Month successor { return september; }
}

doc "September. The nineth month of a gregorian calendar system."
shared object september extends Month(9) {
    shared actual shared actual String string = "september";
    shared actual Month predecessor { return august; }  
    shared actual Month successor { return october; }
}

doc "October. The tenth month of a gregorian calendar system."
shared object october extends Month(10) {
    shared actual shared actual String string = "october";
    shared actual Month predecessor { return september; }  
    shared actual Month successor { return november; }
}

doc "Nobember. The eleventh month of a gregorian calendar system."
shared object november extends Month(11) {
    shared actual shared actual String string = "november";
    shared actual Month predecessor { return october; }  
    shared actual Month successor { return december; }
}

doc "December. The twelveth (last) month of a gregorian calendar system."
shared object december extends Month(12) {
    shared actual shared actual String string = "december";
    shared actual Month predecessor { return november; }  
    shared actual Month successor { return january; }
}
