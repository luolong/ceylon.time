import ceylon.language { Integer }
import ceylon.time { Date }
import ceylon.time.base { DayOfWeek, asDayOfWeek=dayOfWeek, ReadablePeriod, monthOf, Month, days, years }

doc "Default implementation of a gregorian calendar"
shared class GregorianDate( Integer dayOfEra ) 
      extends AbstractDate( dayOfEra ) {

    shared actual Integer year{
        return math.yearFrom( dayOfEra );
    }

    shared actual Month month {
        return math.monthFrom( dayOfEra );
    }

    shared actual Integer day {
        return math.dayFrom( dayOfEra );
    }

    shared actual Integer weekOfYear {
        return nothing;
    }

    doc "True, if this date is a leap year according to gregorian clendar leap year rules."
    shared actual Boolean leapYear {
        return math.leapYear(year);
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
        return math.weekdayFrom( dayOfEra );
    }

    shared actual GregorianDate plusDays(Integer days) {
        if ( days == 0 ) {
            return this;
        }
        return GregorianDate( dayOfEra + days );
    }

    shared actual GregorianDate plusMonths(Integer monthsToAdd) {
        if ( monthsToAdd == 0 ) {
            return this;
        }

        value monthCount = year * 12 + (month.integer - 1);
        value calcMonths = monthCount + monthsToAdd;  // safe overflow
        value newYear = math.floorDiv(calcMonths, 12);
        value newMonth = monthOf(math.floorMod(calcMonths, 12) + 1);
        value newDay = min({day, newMonth.numberOfDays(math.leapYear(newYear))});
        assert (exists newDay);

        return GregorianDate(math.dayOfEra(
                newYear, 
                newMonth.integer, 
                newDay));
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
        return nothing;
    }

    shared actual GregorianDate withMonth(Month month) {
        return nothing;
    }

    shared actual GregorianDate withYear(Integer year) {
        return nothing;
    }

    shared actual GregorianDate plus( ReadablePeriod amount ) {
        return plusDays( amount.date.days ).plusMonths( amount.date.months ).plusYears( amount.date.years );
    }

    shared actual String string {
        return "" year "-" pad(month.integer) "-" pad(day) "";
    }
}

doc "Returns a gregorian calendar date according to the specified year, month and date values"
shared Date gregorianDate(year, month, date){
        doc "Year number of the date"
        Integer year;
        
        doc "Month of the year"
        Integer|Month month; 
        
        doc "Date of month"
        Integer date;
        
    return GregorianDate( math.dayOfEra(year, monthOf(month).integer, date) );
}

doc "Calculate gregorian date values from the specified epoch value"
class EopchToGregorian(Integer epochDay){
    variable value zeroDay = epochDay + days.toEpoch;
    zeroDay -= 60;  // adjust to 0000-03-01 so leap day is at end of four year cycle
    variable value adjust = 0;
    if (zeroDay < 0) {
        // adjust negative years to positive for calculation
        value adjustCycles = (zeroDay + 1) / days.perCycle - 1;
        adjust = adjustCycles * 400;
        zeroDay += -adjustCycles * days.perCycle;
    }
    variable value yearEst = (400 * zeroDay + 591) / days.perCycle;
    variable value doyEst = zeroDay - (365 * yearEst + yearEst / 4 - yearEst / 100 + yearEst / 400);
    if (doyEst < 0) {
        // fix estimate
        yearEst--;
        doyEst = zeroDay - (365 * yearEst + yearEst / 4 - yearEst / 100 + yearEst / 400);
    }
    yearEst += adjust;  // reset any negative year
    value marchDoy0 = doyEst;

    // convert march-based values back to january-based
    value marchMonth0 = (marchDoy0 * 5 + 2) / 153;
    yearEst += marchMonth0 / 10;

    // check year now we are certain it is correct
    assert( years.minimum <= yearEst );
    assert( yearEst <= years.maximum );

    shared Integer year = yearEst;
    shared Integer month = (marchMonth0 + 2) % 12 + 1;
    shared Integer day = marchDoy0 - (marchMonth0 * 306 + 5) / 10 + 1;
}

doc "Common math primitives for calculating gregorian date values"
object math extends CalendarMath() {
    doc "Calculates the day of era of the given gregorian date value." 
    shared Integer dayOfEra(Integer yyyy, Integer mm, Integer dd){
        value y = yyyy;
        value m = mm;
        variable value total = 365 * y;
        if (y >= 0) {
            total += (y + 3) / 4 - (y + 99) / 100 + (y + 399) / 400;
        }
        else {
            total -= y / -4 - y / -100 + y / -400;
        }
        total += ((367 * m - 362) / 12);
        total += dd - 1;
        if (m > 2) {
            total--;
            if (leapYear(yyyy) == false) {
                total--;
            }
        }
        return total - days.toEpoch;
    }

    shared Integer yearFrom(Integer dayOfEra) {
        return EopchToGregorian(dayOfEra).year;
    }

    shared Month monthFrom(Integer dayOfEra) {
        return monthOf(EopchToGregorian(dayOfEra).month);
    }

    shared Integer dayFrom(Integer dayOfEra) {
        return EopchToGregorian(dayOfEra).day;
    }

    shared DayOfWeek weekdayFrom(Integer dayOfEra) {
        return asDayOfWeek( floorMod(dayOfEra + 4, 7) );
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
}
