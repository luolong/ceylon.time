import ceylon.time.base { Month, DayOfWeek }

doc "Default implementation of a gregorian calendar"
shared class GregorianDate( Integer dayOfEra ) 
      extends AbstractDate( dayOfEra ) {

    shared actual Integer year{
        return bottom;
    }

    shared actual Month month {
        return bottom;
    }

    shared actual Integer day {
        return bottom;
    }

    shared actual Integer weekOfYear {
        return bottom;
    }

    doc "True, if this date is a leap year according to gregorian clendar leap year rules."
    shared actual Boolean leapYear {
        return gregorianRules.leapYear(year);
    }

    shared actual Integer dayOfYear {
        return month.fisrtDayOfYear( leapYear ) + day - 1;
    }

    shared actual GregorianDate predecessor {
        return minusDays( 1 );
    }

    shared actual GregorianDate successor {
        return plusDays(1);
    }

    shared actual DayOfWeek weekday {
        return bottom;
    }

    shared actual GregorianDate plusDays(Integer days) {
        if ( days == 0 ) {
            return this;
        }
        return GregorianDate( dayOfEra + days );
    }

    shared actual GregorianDate plusMonths(Integer months) {
        if ( months == 0 ) {
            return this;
        }

        return bottom;
    }

    shared actual GregorianDate plusYears(Integer years) {
        if ( years == 0 ) {
            return this;        }

        return withYear( year + years );
    }

    shared actual GregorianDate plusWeeks(Integer weeks) {
        return plusDays( weeks * 7 );
    }

    shared actual GregorianDate minusDays(Integer days) {
        return plusDays(-days);
    }

    shared actual GregorianDate minusWeeks(Integer weeks) {
        return plusWeeks( -weeks );
    }

    shared actual GregorianDate minusMonths(Integer months) {
        return plusMonths(-months);
    }

    shared actual GregorianDate minusYears(Integer years) {
        return plusYears(-years);
    }

    shared actual GregorianDate withDay(Integer day) {
        return bottom;
    }

    shared actual GregorianDate withMonth(Month month) {
        return bottom;
    }

    shared actual GregorianDate withYear(Integer year) {
        return bottom;
    }

    shared actual String string {
        return "" year "-" pad(month.integer) "-" pad(day) "";
    }
}

shared object gregorianRules extends CalendarMath() {
    doc "Computes [Julian Day Number] of the provided gregorian calendar date
         according to the [formula] provided in Wikipedia article.

         [Julian Day Number]: http://en.wikipedia.org/wiki/Julian_day
         [formula]: http://en.wikipedia.org/wiki/Julian_day#Converting_Gregorian_calendar_date_to_Julian_Day_Number
         "
    shared Integer jdn(year, month, day){

        doc "Year of the gregorian date"
        Integer year;
        doc "Month of the gregorian date"
        Integer month;
        doc "Day of month of the gregorian date"
        Integer day;

        value a = (14-month)/12;
        value y = year + 4800 - a;
        value m = month + 12*a - 3;

        return day + (153*m + 2)/5 + 365*y + y/4 - y/100 + y/400 - 32045;
    }

    doc "Calculates epoch date from the provided Julian Day Number."
    shared Integer epoch( jdn ){

        doc "Julian Day Number"
        Integer jdn;

        return jdn - 2440587;
    }

    doc "Calculates if the given year is a leap year"
    shared Boolean leapYear( Integer year ) {
        if (year % 400 == 0) {
            return true;
        }
        if (year % 100 == 0) {
            return false;
        }
        return (year % 4 == 0);
    }

    doc "Calculates the day of era of the given date value." 
    shared Integer dayOfEra(Integer yyyy, Integer mm, Integer dd){
        return epoch(jdn(yyyy, mm, dd));
    }
}