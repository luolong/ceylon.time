import ceylon.language { Integer }
import ceylon.math.float { log10 }
import ceylon.math.integer { smallest }
import ceylon.time.base { Month, february, april, june, september, november, ms=milliseconds, sec=seconds, min=minutes, h=hours, monthOf }

Integer resolveLastValidDay(Integer|Month month, Integer day, Boolean leapYear ) {
    Month actualMonth = monthOf(month);

    variable Integer newDay = day;

    if ( february == actualMonth ) {
        newDay = smallest(day,  ( leapYear ) then 29 else 28 );
    }
    else if ( april == actualMonth 
            || june == actualMonth 
            || september == actualMonth 
            || november == actualMonth ) {
        newDay = smallest(day, 30);
    }
    else {
        newDay = smallest(day, 31);
    }

    return newDay;
}

shared Integer daysFromMillis( Integer hours = 0, Integer minutes = 0, Integer seconds = 0, Integer millis = 0) {
    return millis / ms.perDay +
           seconds / sec.perDay +
           minutes / min.perDay +
           hours / h.perDay;
}

shared Integer normalizedTimeInMillis( Integer hours = 0, Integer minutes = 0, Integer seconds = 0, Integer millis = 0) {
    value totalMillis = hours * ms.perHour + minutes * ms.perMinute + seconds * ms.perSecond + millis;
    return totalMillis % ms.perDay;
}

doc "return padded value"
shared String pad(Integer number, String padding = "00"){
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
