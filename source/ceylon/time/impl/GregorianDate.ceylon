import ceylon.language { Integer }
import ceylon.time { Date }
import ceylon.time.base { Weekday, weekdayOf=weekday, ReadablePeriod, monthOf, Month, days, january, sunday }
import ceylon.time.chronology { impl=gregorian }


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

    shared actual Weekday weekday {
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

        value o = month.add(months);
        value d = min{day, o.month.numberOfDays(impl.leapYear(year + o.years))};

        return GregorianDate( impl.fixedFrom([year + o.years, o.month.integer, d]) );
    }

    shared actual GregorianDate plusYears(Integer years) {
        if ( years == 0 ) {
            return this;        }

        return withYear( year + years );
    }

    shared actual GregorianDate plusWeeks(Integer weeks) {
        return plusDays( weeks * days.perWeek );
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
        return GregorianDate( dayOfEra - this.day + resolveLastValidDay(month, day, leapYear));
    }

    shared actual GregorianDate withMonth(Month month) {
        Month newMonth = monthOf(month);
        if ( newMonth == this.month ) {
            return this;
        }

		value d = min{day, month.numberOfDays(impl.leapYear(year))};

        return GregorianDate( impl.fixedFrom([year, newMonth.integer, d]) );
    }

    shared actual GregorianDate withYear(Integer year) {
        if ( year == this.year ) {
            return this;
        }
        value correction = ( day == 29 && leapYear) then 1 else 0;

        return GregorianDate( impl.fixedFrom([year, month.integer, day - correction]) );
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
        return "``year``-``pad(month.integer)``-``pad(day)``";	
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
