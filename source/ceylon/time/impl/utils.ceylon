import ceylon.math.float { log10 }
import ceylon.math.integer { smallest }
import ceylon.time.base { MonthOfYear, january, february, march, april, may, june, july, august, september, october, november, december, monthOfYear }

Integer floorMod(Integer a, Integer b) {
    return (((a % b) + b) % b);
}

Integer floorDiv(Integer a, Integer b) {
    return (a >= 0 then a / b else ((a + 1) / b) - 1);
}

Integer floor(Integer a, Integer b) {
    return (a >= 0 then a / b else ((a + 1) / b) - 1);
}


Integer resolveLastValidDay(Integer|MonthOfYear month, Integer day, Boolean leapYear ) {
    MonthOfYear actualMonth = monthOfYear(month);

    variable Integer newDay := day;

    if ( february == actualMonth ) {
        newDay := smallest(day,  ( leapYear ) then 29 else 28 );
    }
    else if ( april == actualMonth 
            || june == actualMonth 
            || september == actualMonth 
            || november == actualMonth ) {
        newDay := smallest(day, 30);
    }
    else {
        newDay := smallest(day, 31);
    }

    return newDay;
}

shared Integer firstDayOfYear( MonthOfYear month, Boolean leapYear ) {
    value leap = leapYear then 1 else 0;
    switch (month)
    case ( january)    { return 1; }
    case ( february )  { return 32; }
    case ( march )     { return 60 + leap; }
    case ( april )     { return 91 + leap; }
    case ( may )       { return 121 + leap; }
    case ( july )      { return 182 + leap; }
    case ( june )      { return 152 + leap; }
    case ( august )    { return 213 + leap; }
    case ( september ) { return 244 + leap; }
    case ( october )   { return 274 + leap; }
    case ( november )  { return 305 + leap; }
    case ( december )  { return 335 + leap; }
}

shared Boolean leapYear( Integer year ) {
    if (year % 400 == 0){ return true; }
    if (year % 100 == 0){ return false; }
    if (year % 4 == 0){ return true; }
    return false;
}

shared Integer daysFromMillis( Integer hours = 0, Integer minutes = 0, Integer seconds = 0, Integer millis = 0) {
    return millis / milliPerDay.maximumRepresentation +
                seconds / secondPerDay.maximumRepresentation +
                minutes / minutePerDay.maximumRepresentation +
                hours / hourPerDay.maximumRepresentation;  
}

shared Integer restOfMillisPerDay( Integer hours = 0, Integer minutes = 0, Integer seconds = 0, Integer millis = 0) {
	return millis % milliPerDay.maximumRepresentation +
                (seconds % secondPerDay.maximumRepresentation) * milliPerSecond.maximumRepresentation +
                (minutes % minutePerDay.maximumRepresentation) * milliPerMinute.maximumRepresentation +
                (hours % hourPerDay.maximumRepresentation) * milliPerHour.maximumRepresentation;
}

doc "return padded value"
String pad(Integer number, String padding = "00"){
    if (number == 0){
        return padding;
    }

    value digits = log10( number.magnitude.float ).wholePart.integer + 1;
    if (digits < padding.size) {
        value padded = padding.plus( number.string );
        return padded.segment(
                      padded.size - padding.size,
                      padding.size );
    }

    return number.string;
}