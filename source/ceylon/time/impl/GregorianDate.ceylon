import ceylon.language { Integer }
import ceylon.time { Date }
import ceylon.time.chronology { impl = gregorian }
import ceylon.time.math{ fdiv, mod }
import ceylon.time.base { DayOfWeek, weekdayOf=dayOfWeek, ReadablePeriod, monthOf, Month, days, mth=months, years, january, sunday }


doc "Default implementation of a gregorian calendar"
shared class GregorianDate( Integer dayOfEra ) 
      extends AbstractDate( dayOfEra ) {

    shared actual Integer year{
        return impl.yearFrom( dayOfEra );
    }

    shared actual Month month {
        return monthOf(impl.monthFrom( dayOfEra ));
    }

    shared actual Integer day {
        return impl.dayFrom( dayOfEra );
    }

    doc "True, if this date is a leap year according to gregorian calendar leap year rules."
    shared actual Boolean leapYear {
        return impl.leapYear( year );
    }

    shared actual Integer dayOfYear {
        return month.fisrtDayOfYear( leapYear ) + day - 1;
    }

    shared actual GregorianDate predecessor {
        return minusDays( 1 );
    }

    shared actual GregorianDate successor {
        return plusDays( 1 );
    }

    shared actual DayOfWeek weekday {
        return weekdayOf(impl.weekdayFrom( dayOfEra ));
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

        value o = month.addMonths(months);
        value d = min{day, o.month.numberOfDays(impl.leapYear(year + o.years))};

        return GregorianDate( impl.fixedFrom([year + o.years, o.month.integer, d]) );
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
        if ( day == this.day ) {
            return this;
        }
        //return GregorianDate( dayOfEra - this.day + resolveLastValidDay(month, day, leapYear));
        return nothing;
    }

    shared actual GregorianDate withMonth(Month month) {
        Month newMonth = monthOf(month);
        if ( month == this.month ) {
            return this;
        }

        //return GregorianDate( math.dayOfEra(year, newMonth.integer, resolveLastValidDay(newMonth, day, leapYear) ));
        return nothing;
    }

    shared actual GregorianDate withYear(Integer year) {
        if ( year == this.year ) {
            return this;
        }
        return nothing;
        //return GregorianDate( math.dayOfEra(year, month.integer, resolveLastValidDay(month, day, math.leapYear(year)) ));
    }

    shared actual GregorianDate plus( ReadablePeriod amount ) {
        return plusDays( amount.date.days ).plusMonths( amount.date.months ).plusYears( amount.date.years );
    }

    doc "Week of year calculations is UTC based"
    shared actual Integer weekOfYear {
        value weekFromYearBefore = 0;
        value possibleNextYearWeek = 53;

        function normalizeFirstWeek( Integer weekNumber ) {
            variable value result = weekNumber;
            if ( weekNumber == 0 ) {
                value jan1 = withDay(1).withMonth(january);
                value jan1WeekDay = jan1.weekday == sunday then 7 else jan1.weekday.integer; 

                if ( ( dayOfYear <= ( 8 - jan1WeekDay ) ) && jan1WeekDay > 4 ) {
                    if ( jan1WeekDay == 5 || (jan1WeekDay == 6 && minusYears(1).leapYear)) {
                        result = 53;
                    } else {
                        result = 52;
                    }
                }
            }
            return result;
        }

        function normalizeLastWeek( Integer weekNumber ) {
            variable value result = weekNumber;
            if ( weekNumber == 53 ) {
                value weekDay = weekday == sunday then 7 else weekday.integer; 
                value totalDaysInYear = leapYear then 366 else 365;
                if (( totalDaysInYear - dayOfYear) < (4 - weekDay) ) {
                    result = 1;
                }
            }
            return result;
        }

        value dayOfWeekNumber = weekday == sunday then 7 else weekday.integer;
        variable value weekNumber = ( dayOfYear - dayOfWeekNumber + 10 ) / 7;

        if ( weekNumber == weekFromYearBefore ) {
            weekNumber = normalizeFirstWeek( weekNumber );
        } else if ( weekNumber == possibleNextYearWeek ) {
            weekNumber = normalizeLastWeek( weekNumber );
        }

        return weekNumber;
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
        
    return GregorianDate( impl.fixedFrom([year, monthOf(month).integer, date]) );
}

doc "Calculate gregorian date values from the specified epoch value"
class EpochToGregorian(Integer epochDay){
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
        return EpochToGregorian(dayOfEra).year;
    }

    shared Month monthFrom(Integer dayOfEra) {
        return monthOf(EpochToGregorian(dayOfEra).month);
    }

    shared Integer dayFrom(Integer dayOfEra) {
        return EpochToGregorian(dayOfEra).day;
    }

    shared DayOfWeek weekdayFrom(Integer dayOfEra) {
        return weekdayOf( floorMod(dayOfEra + 4, 7) );
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
