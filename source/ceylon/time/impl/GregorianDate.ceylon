import ceylon.language { Integer }
import ceylon.time { Date, dateTime, DateTime }
import ceylon.time.base { DayOfWeek, weekdayOf=dayOfWeek, monthOf, Month, days, january, sunday, ReadableDatePeriod }
import ceylon.time.chronology { impl=gregorian }
import ceylon.time.math { adjustedMod }


doc "Default implementation of a gregorian calendar"
shared class GregorianDate( Integer dayOfEra ) 
      extends AbstractDate( dayOfEra ) {

    shared actual Integer year => impl.yearFrom( dayOfEra );

    shared actual Month month => monthOf(impl.monthFrom( dayOfEra ));

    shared actual Integer day => impl.dayFrom( dayOfEra );

    doc "True, if this date is a leap year according to gregorian calendar leap year rules."
    shared actual Boolean leapYear => impl.leapYear( year );

    shared actual Integer dayOfYear => month.fisrtDayOfYear( leapYear ) + day - 1;

    shared actual GregorianDate predecessor => minusDays( 1 );

    shared actual GregorianDate successor => plusDays( 1 );

    shared actual DayOfWeek dayOfWeek => weekdayOf(impl.dayOfWeekFrom( dayOfEra ));

    shared actual GregorianDate plusDays(Integer days) {
        if ( days == 0 ) {
            return this;
        }
        return GregorianDate( dayOfEra + days );
    }

    shared actual GregorianDate plusWeeks(Integer weeks) => plusDays( weeks * days.perWeek );

    shared actual GregorianDate plusMonths(Integer months) {
        if ( months == 0 ) {
            return this;
        }

        value o = month.add(months);
        value newYear = year + o.years;

        impl.validateDate([newYear, o.month.integer,day]);
        return GregorianDate( impl.fixedFrom([newYear, o.month.integer, day]) );
    }

    shared actual GregorianDate plusYears(Integer years) {
        if ( years == 0 ) {
            return this;        }

        return withYear( year + years );
    }

    shared actual GregorianDate minusDays(Integer days)  => plusDays(-days);

    shared actual GregorianDate minusWeeks(Integer weeks) => plusWeeks( -weeks );

    shared actual GregorianDate minusMonths(Integer months) => plusMonths(-months);

    shared actual GregorianDate minusYears(Integer years) => plusYears(-years);

    shared actual GregorianDate withDay(Integer day) {
        if ( day == this.day ) {
            return this;
        }
        impl.validateDate([year,month.integer,day]);
        return GregorianDate( dayOfEra - this.day + day);
    }

    shared actual GregorianDate withMonth(Month month) {
        Month newMonth = monthOf(month);
        if ( newMonth == this.month ) {
            return this;
        }

        impl.validateDate([year,newMonth.integer,day]);
        return GregorianDate( impl.fixedFrom([year, newMonth.integer, day]) );
    }

    shared actual GregorianDate withYear(Integer year) {
        if ( year == this.year ) {
            return this;
        }

        impl.validateDate([year,month.integer,day]);
        return GregorianDate( impl.fixedFrom([year, month.integer, day]) );
    }

    shared actual GregorianDate plus( ReadableDatePeriod amount ) {
        return plusYears( amount.years )
              .plusMonths( amount.months )
              .plusDays( amount.days );
    }

    shared actual GregorianDate minus( ReadableDatePeriod amount ) {
        return minusYears( amount.years )
              .minusMonths( amount.months )
              .minusDays( amount.days );
    }

    doc "Week of year calculations is UTC based"
    shared actual Integer weekOfYear {
        value weekFromYearBefore = 0;
        value possibleNextYearWeek = 53;

        function normalizeFirstWeek( Integer weekNumber ) {
            variable value result = weekNumber;
            value jan1 = withDay(1).withMonth(january);
            value jan1WeekDay = jan1.dayOfWeek == sunday then 7 else jan1.dayOfWeek.integer; 
            if ( ( dayOfYear <= ( 8 - jan1WeekDay ) ) && jan1WeekDay > 4 ) {
                if ( jan1WeekDay == 5 || (jan1WeekDay == 6 && minusYears(1).leapYear)) {
                    result = 53;
                } else {
                    result = 52;
                }
            }
            return result;
        }

        function normalizeLastWeek( Integer weekNumber ) {
            variable value result = weekNumber;
            value weekDay = adjustedMod(dayOfWeek.integer, 7); 
            value totalDaysInYear = leapYear then 366 else 365;
            if (( totalDaysInYear - dayOfYear) < (4 - weekDay) ) {
                result = 1;
            }
            return result;
        }

        value dayOfWeekNumber = adjustedMod(dayOfWeek.integer, 7);
        variable value weekNumber = ( dayOfYear - dayOfWeekNumber + 10 ) / 7;

        if ( weekNumber == weekFromYearBefore ) {
            weekNumber = normalizeFirstWeek( weekNumber );
        } else if ( weekNumber == possibleNextYearWeek ) {
            weekNumber = normalizeLastWeek( weekNumber );
        }

        return weekNumber;
    }

    shared actual DateTime at( Integer hours, Integer minutes, Integer seconds, Integer milliseconds) {
        return dateTime(year, month, day, hours, minutes, seconds, milliseconds);
    }

    shared actual String string {
        return "``year``-``leftPad(month.integer)``-``leftPad(day)``";	
    }
}

doc "Returns a gregorian calendar date according to the specified year, month and date values"
shared Date gregorianDate(year, month, day){
        doc "Year number of the date"
        Integer year;
        
        doc "Month of the year"
        Integer|Month month; 
        
        doc "Day of month"
        Integer day;
 
    impl.validateDate([year, monthOf(month).integer, day]);       
    return GregorianDate( impl.fixedFrom([year, monthOf(month).integer, day]) );
}