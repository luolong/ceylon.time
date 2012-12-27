import ceylon.time { Time, time }
import ceylon.time.base { ms=milliseconds, sec=seconds, min=minutes, h=hours }

doc "Extremely simple implementation of Time interface, representing an 
     abstraction of a _time of day_ such as 10am or 3.20pm."
shared class TimeOfDay(millisOfDay) 
       satisfies Time {

    doc "Number of milliseconds since last midnight"
    shared actual Integer millisOfDay;

    doc "Number of milliseconds since last full second"
    shared actual Integer millis {
        return millisOfDay % ms.perDay;
    }

    doc "Number of seconds since last midnight"
    shared actual Integer secondsOfDay {
        return millisOfDay / ms.perSecond;
    }

    shared actual Integer seconds {
        return secondsOfDay % sec.perDay;
    }

    doc "Number of minutes since last midnight"
    shared actual Integer minutesOfDay {
        return secondsOfDay / sec.perMinute;
    }

    doc "Number of minutes since last full hour."
    shared actual Integer minutes {
        return minutesOfDay % min.perHour;
    }

    doc "Number of full hours elapsed since last midnight."
    shared actual Integer hours {
        return minutesOfDay / min.perHour;
    }

    doc "Compare two instants of time"
    shared actual Comparison compare(Time other) {
        return millisOfDay <=> other.millisOfDay;
    }

    doc "Previous millisecond"
    shared actual Time predecessor {
        return minusSeconds(1);
    }

    doc "Next millisecond"
    shared actual Time successor {
        return plusSeconds(1);
    }

    doc "Returns standard extended ISO format of the time"
    shared actual String string {
        return "" pad(hours) ":" pad(minutes) ":" pad(seconds) "." millis "";
    }

    shared actual Integer distanceFrom(Time other) {
        return millisOfDay.distanceFrom(other.millisOfDay) ;
    }

    shared actual Time minusHours(Integer hours) {
        return plusHours(-(hours % h.perDay));
    }

    shared actual Time minusMilliseconds(Integer milliseconds) {
        return plusMilliseconds( -( milliseconds % ms.perDay ) );
    }

    shared actual Time minusMinutes(Integer minutes) {
        return plusMinutes(-(minutes % min.perDay ));
    }

    shared actual Time minusSeconds(Integer seconds) {
        return plusSeconds(-(seconds % sec.perDay));
    }

    shared actual Time plusHours(Integer hours) {
        if (hours == 0) {
            return this;
        }

        Integer hoursPerDay = h.perDay;
        Integer newHour = ((hours % hoursPerDay) + this.hours + hoursPerDay) % hoursPerDay;
        return time(newHour, minutes, seconds, millis);
    }

    shared actual Time plusMilliseconds(Integer milliseconds) {
        if ( milliseconds == 0 ) {
            return this;
        }
        return time( hours, minutes, seconds, this.millis + milliseconds );
    }

    shared actual Time plusMinutes(Integer minutes) {
        if (minutes == 0) {
            return this;
        }

        Integer minutesPerHour = min.perHour;
        Integer minutesPerDay = min.perDay;

        Integer minutesOfDay = hours * minutesPerHour + this.minutes;
        Integer newMinutesOfDay = ((minutes % minutesPerDay) + minutesOfDay + minutesPerDay) % minutesPerDay;
        if (minutesOfDay == newMinutesOfDay) {
            return this;
        }
        Integer newHour = newMinutesOfDay / minutesPerHour;
        Integer newMinute = newMinutesOfDay % minutesPerHour;
        return time(newHour, newMinute, seconds, millis);
    }

    shared actual Time plusSeconds(Integer seconds) {
        if (seconds == 0) {
            return this;
        }

        Integer sofd = hours * sec.perHour
                     + minutes * sec.perMinute
                     + this.seconds;

        Integer newSofd = ((seconds % sec.perDay) + sofd + sec.perDay) % sec.perDay;
        if (sofd == newSofd) {
            return this;
        }

        Integer newHour = newSofd / sec.perHour;
        Integer newMinute = (newSofd / sec.perMinute) % min.perHour;
        Integer newSecond = newSofd % sec.perMinute;
        return time(newHour, newMinute, newSecond, millis);
    }

    shared actual Time withHours(Integer hours) {
        if (this.hours == hours) {
            return this;
        }
        assert( 0 <= hours && hours <= h.perDay );
        return time(hours, minutes, seconds, millis);
    }

    shared actual Time withMinutes(Integer minutes) {
        if (this.minutes == minutes) {
            return this;
        }
        assert( 0 <= minutes && minutes <= min.perHour );
        return time(hours, minutes, seconds, millis);
    }
    shared actual Time withSeconds(Integer seconds) {
        if (this.seconds == seconds) {
            return this;
        }
        assert(0 <= seconds && seconds <= sec.perMinute);
        return time(hours, minutes, seconds, millis );
    }
    shared actual Time withMilliseconds(Integer milliseconds) {
        if (this.millis == milliseconds) {
            return this;
        }
        assert(0 <= milliseconds && milliseconds <= ms.perSecond);
        return time(hours, minutes, seconds, milliseconds);
    }

    shared actual Boolean equals( Object other ) {
        if ( is TimeOfDay other ) {
            return millisOfDay == other.millisOfDay;
        }
        return false;
    }

}
