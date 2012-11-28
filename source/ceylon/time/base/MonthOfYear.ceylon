shared abstract class MonthOfYear(integer)
       of january | february | march | april | may | june | july | august | september | october | november | december
       satisfies Ordinal<MonthOfYear> & Comparable<MonthOfYear>{

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

    doc "Compares ordinal numbers of two instances of `MonthOfYear`"
    shared actual Comparison compare(MonthOfYear other) {
        return integer.compare(other.integer);
    }

    doc "Returns month of year that comes specified number of months after this month."
    shared MonthOfYear plusMonths(Integer number) {
        value m = (integer + number) % 12;
        assert (exists month = months[m]); 
        return month;
    }

    doc "Returns month of year that comes specified number of months before this month."
    shared MonthOfYear minusMonths(Integer number) {
        return plusMonths(12 - (number % 12));
    }

    doc "Returns number of months separating the other month from this one."
    shared actual Integer distanceFrom(MonthOfYear other) {
        return integer.distanceFrom(other.integer);
    }
}

doc "Enumeration of months of Gregorian/Julian calendar system from January to December"
shared MonthOfYear[] months = {january, february, march, april, may, june, july, august, september, october, november, december};

doc "Returns month of year specified by the input argument.

     If input is an Integer, this method returns a month according to the integer 
     value of the [[MonthOfYear]] (i.e. 1=[[january]], 2=[[february]], ... 12=[[december]])
     Any invalid values will throw an exception.

     If the imput value is a [[MonthOfYear]], the input value is returned as is."
shared MonthOfYear monthOfYear(Integer|MonthOfYear month){
    switch (month)
    case (is MonthOfYear) { return month; }
    case (is Integer) {
        assert ( 1 <= january.integer && month <= december.integer );
        assert ( exists m = months[month-1] );
        return m;
    }
}

doc "January. The first month of a Gregorian/Julian calendar system."
shared object january extends MonthOfYear(1) {
    shared actual String string = "january";
    shared actual MonthOfYear predecessor { return december; }  
    shared actual MonthOfYear successor { return february; }
}

doc "February. The second month of a gregorian calendar system."
shared object february extends MonthOfYear(2) {
    shared actual String string = "february";
    shared actual MonthOfYear predecessor { return january; }  
    shared actual MonthOfYear successor { return march; }
}

doc "March. The third month of a gregorian calendar system."
shared object march extends MonthOfYear(3) {
    shared actual String string = "march";
    shared actual MonthOfYear predecessor { return february; }  
    shared actual MonthOfYear successor { return april; }
}

doc "April. The fourth month of a gregorian calendar system."
shared object april extends MonthOfYear(4) {
    shared actual String string = "april";
    shared actual MonthOfYear predecessor { return march; }  
    shared actual MonthOfYear successor { return may; }
}

doc "May. The fifth month of a gregorian calendar system."
shared object may extends MonthOfYear(5) {
    shared actual String string = "may";
    shared actual MonthOfYear predecessor { return april; }  
    shared actual MonthOfYear successor { return june; }
}

doc "June. The sixth month of a gregorian calendar system."
shared object june extends MonthOfYear(6) {
    shared actual String string = "june";
    shared actual MonthOfYear predecessor { return may; }
    shared actual MonthOfYear successor { return july; }
}

doc "July. The seventh month of a gregorian calendar system."
shared object july extends MonthOfYear(7) {
    shared actual shared actual String string = "july";
    shared actual MonthOfYear predecessor { return june; }  
    shared actual MonthOfYear successor { return august; }
}

doc "August. The eigth month of a gregorian calendar system."
shared object august extends MonthOfYear(8) {
    shared actual shared actual String string = "august";
    shared actual MonthOfYear predecessor { return july; }  
    shared actual MonthOfYear successor { return september; }
}

doc "September. The nineth month of a gregorian calendar system."
shared object september extends MonthOfYear(9) {
    shared actual shared actual String string = "september";
    shared actual MonthOfYear predecessor { return august; }  
    shared actual MonthOfYear successor { return october; }
}

doc "October. The tenth month of a gregorian calendar system."
shared object october extends MonthOfYear(10) {
    shared actual shared actual String string = "october";
    shared actual MonthOfYear predecessor { return september; }  
    shared actual MonthOfYear successor { return november; }
}

doc "Nobember. The eleventh month of a gregorian calendar system."
shared object november extends MonthOfYear(11) {
    shared actual shared actual String string = "november";
    shared actual MonthOfYear predecessor { return october; }  
    shared actual MonthOfYear successor { return december; }
}

doc "December. The twelveth (last) month of a gregorian calendar system."
shared object december extends MonthOfYear(12) {
    shared actual shared actual String string = "december";
    shared actual MonthOfYear predecessor { return november; }  
    shared actual MonthOfYear successor { return january; }
}
