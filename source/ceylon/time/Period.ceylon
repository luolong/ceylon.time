import ceylon.math.whole{Whole, wholeNumber}
import ceylon.time.base {
    ReadablePeriod, PeriodBehavior, ReadableDatePeriod, ReadableTimePeriod, 
    min = minutes, sec = seconds, ms = milliseconds}

doc "An immutable period consisting of the ISO-8601 _years_, _months_, _days_, _hours_,
     _minutes_, _seconds_ and _milliseconds_, such as '3 Months, 4 Days and 7 Hours'.

     A period is a human-scale description of an amount of time.
     "
shared class Period(years=0, months=0, days=0, hours=0, minutes=0, seconds=0, milliseconds=0)
       satisfies ReadablePeriod & ReadableTimePeriod & ReadableDatePeriod
               & PeriodBehavior<Period>
               & Comparable<Period> 
               & Summable<Period> {

    doc "The number of years."
    shared actual Integer years;

    doc "The number of months"
    shared actual Integer months;

    doc "The number of days"
    shared actual Integer days;

    doc "The number of hours"
    shared actual Integer hours;

    doc "The number of minutes"
    shared actual Integer minutes;

    doc "The number of seconds"
    shared actual Integer seconds;

    doc "The number of milliseconds"
    shared actual Integer milliseconds;

    doc "Checks if this period is equal to another period."
    shared actual Boolean equals(Object that){
        if (is Period that) {
            if (this === that){
                return true;
            }

            return (this.years == that.years
                 && this.months == that.months
                 && this.days == that.days
                 && this.hours == that.hours
                 && this.minutes == that.minutes
                 && this.seconds == that.seconds
                 && this.milliseconds == that.milliseconds);
        }

        return false;
    }

    shared actual Comparison compare(Period other) {
        Period norm1 = this.normalized();
        Period norm2 = other.normalized();

        return norm1.years != norm2.years          then norm1.years   <=> norm2.years 
            else ( norm1.months != norm2.months    then norm1.months  <=> norm2.months
            else ( norm1.days != norm2.days        then norm1.days    <=> norm2.days
            else ( norm1.hours != norm2.hours      then norm1.hours   <=> norm2.hours
            else ( norm1.minutes != norm2.minutes  then norm1.minutes <=> norm2.minutes
            else ( norm1.seconds != norm2.seconds  then norm1.seconds <=> norm2.seconds
            else   norm1.milliseconds <=> norm2.milliseconds ) ) ) ) );
    }

    doc "Checks if this period is zero-length."
    shared Boolean isZero(){
        return this == zero;
    }

    doc "Returns a copy of this period with the specified amount of years."
    shared actual Period withYears(Integer years){
        if (years == this.years){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified amount of months."
    shared actual Period withMonths(Integer months){
        if (months == this.months){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified amount of days."
    shared actual Period withDays(Integer days){
        if (days == this.days){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified amount of hours."
    shared actual Period withHours(Integer hours){
        if (hours == this.hours){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified amount of minutes."
    shared actual Period withMinutes(Integer minutes){
        if (minutes == this.minutes){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified amount of seconds."
    shared actual Period withSeconds(Integer seconds){
        if (seconds == this.seconds){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified amount of nanos."
    shared actual Period withMilliseconds(Integer milliseconds){
        if (milliseconds == this.milliseconds){
            return this;
        }
        return Period(years, months, days, hours, minutes, seconds, milliseconds);
    }

    doc "Returns a copy of this period with the specified number of years added."
    shared actual Period plusYears(Integer years){
        if (years == 0){
            return this;
        }
        return withYears( this.years + years );
    }

    doc "Returns a copy of this period with the specified number of months added."
    shared actual Period plusMonths(Integer months){
        if (months == 0){
            return this;
        }
        return withMonths( this.months + months );
    }

    doc "Returns a copy of this period with the specified number of days added."
    shared actual Period plusDays(Integer days){
        if (days == 0){
            return this;
        }
        return withDays( this.days + days );
    }

    doc "Returns a copy of this period with the specified number of hours added."
    shared actual Period plusHours(Integer hours){
        if (hours == 0){
            return this;
        }
        return withHours( this.hours + hours );
    }

    doc "Returns a copy of this period with the specified number of minutes added."
    shared actual Period plusMinutes(Integer minutes){
        if (minutes == 0){
            return this;
        }
        return withMinutes( this.minutes + minutes );
    }

    doc "Returns a copy of this period with the specified number of seconds added."
    shared actual Period plusSeconds(Integer seconds){
        if (seconds == 0){
            return this;
        }
        return withSeconds( this.seconds + seconds );
    }

    doc "Returns a copy of this period with the specified number of nonoseconds added."
    shared actual Period plusMilliseconds(Integer milliseconds){
        if (milliseconds == 0){
            return this;
        }
        return withMilliseconds( this.milliseconds + milliseconds );
    }

    doc "Returns a copy of this period with the specified number of years subtracted."
    shared actual Period minusYears(Integer years){
        return plusYears( - years );
    }

    doc "Returns a copy of this period with the specified number of months subtracted."
    shared actual Period minusMonths(Integer months){
        return plusMonths( - months );
    }

    doc "Returns a copy of this period with the specified number of days subtracted."
    shared actual Period minusDays(Integer days){
        return plusDays( - days );
    }

    doc "Returns a copy of this period with the specified number of hours subtracted."
    shared actual Period minusHours(Integer hours){
        return plusHours( - hours );
    }

    doc "Returns a copy of this period with the specified number of minutes subtracted."
    shared actual Period minusMinutes(Integer minutes){
        return plusMinutes( - minutes );
    }

    doc "Returns a copy of this period with the specified number of seconds subtracted."
    shared actual Period minusSeconds(Integer seconds){
        return plusSeconds( - seconds );
    }

    doc "Returns a copy of this period with the specified number of nonoseconds subtracted."
    shared actual Period minusMilliseconds(Integer milliseconds){
        return plusMilliseconds( - milliseconds );
    }

    doc "Returns a new period that is a sum of the two periods."
    shared actual Period plus(Period other) {
        return Period {
            years = this.years + other.years;
            months = this.months + other.months;
            days = this.days + other.days;
            hours = this.hours + other.hours;
            minutes = this.minutes + other.minutes;
            seconds = this.seconds + other.seconds;
            milliseconds = this.milliseconds + other.milliseconds;
        };
    }

    shared actual ReadableDatePeriod date {
        return this;
    }

    shared actual ReadableTimePeriod time {
        return this;
    }

    //TODO: create an instant
    //shared Instant from( Instant instant ) {
    //}

    doc "Returns a copy of this period with all amounts normalized to the 
         standard ranges for date/time fields.

         Two normalizations occur, one for years and months, and one for
         hours, minutes, seconds and nanoseconds.

         Days are not normalized, as a day may vary in length at daylight savings cutover.
         Neither is days normalized into months, as number of days per month varies from 
         month to another and depending on the leap year."
    shared actual Period normalized(){
        if (this == zero) {
            return zero;
        }

        value years = this.years + this.months / 12;
        value months = this.months % 12;

        variable Whole total = wholeNumber(this.hours * sec.perHour)
                              + wholeNumber(this.minutes * sec.perMinute)
                              + wholeNumber(this.seconds);

        value millis = ( wholeNumber(this.milliseconds) % wholeNumber(( ms.perSecond )) ).integer;
        total += wholeNumber(this.milliseconds) / wholeNumber(( ms.perSecond ));

        value seconds = ( total % wholeNumber(( sec.perMinute )) ).integer;
        total = total / wholeNumber(( sec.perMinute ));

        value minutes = ( total % wholeNumber(min.perHour) ).integer;
        value hours = ( total / wholeNumber(min.perHour ) ).integer;

        return Period {
            years = years;
            months = months;
            days = days;
            hours = hours;
            minutes = minutes;
            seconds = seconds;
            milliseconds = millis;
        };
    }

    shared actual String string {
        if (this == zero) {
            return "PT0S";
        } else {
            StringBuilder buf = StringBuilder();
            buf.append('P');
            if (years != 0) {
                buf.append(years.string).append('Y');
            }
            if (months != 0) {
                buf.append(months.string).append('M');
            }
            if (days != 0) {
                buf.append(days.string).append('D');
            }
            if ( hours != 0 || minutes != 0 || seconds != 0 || milliseconds != 0 ) {
                buf.append('T');
                if (hours != 0) {
                    buf.append(hours.string).append('H');
                }
                if (minutes != 0) {
                    buf.append(minutes.string).append('M');
                }
                //value secondPart = seconds;
                //value milliPart = milliseconds;
                //TODO: Ceylon does not have it, yet. Also waiting TimeZone Impl
                //value secsMillisOr = secondPart | milliPart;
                //if (secsNanosOr != 0) {  // if either non-zero
                //    if ((secsNanosOr | Integer.MIN_VALUE) != 0) {  // if either less than zero
                //        buf.append('-');
                //        secondPart = Math.abs(secondPart);
                //        nanoPart = Math.abs(nanoPart);
                //    }
                //    buf.append(secondPart);
                //    int dotPos = buf.length();
                //    nanoPart += 1000_000_000;
                //    while (nanoPart % 10 == 0) {
                //        nanoPart /= 10;
                //    }
                //    buf.append(nanoPart);
                //    buf.setCharAt(dotPos, '.');
                //    buf.append('S');
                //}
            }
            return buf.string;
        }
	}

}

doc "A period of zero length"
shared Period zero = Period();
