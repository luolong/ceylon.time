import ceylon.time { Time, time }
import ceylon.time.base { ms=milliseconds, sec=seconds, h=hours }
import ceylon.time.chronology { timeCheck = time }

doc "Extremely simple implementation of Time interface, representing an 
     abstraction of a _time of day_ such as 10am or 3.20pm."
shared class TimeOfDay(millisOfDay) 
       satisfies Time {

    doc "Number of milliseconds since last midnight"
    shared actual Integer millisOfDay;

    doc "Number of milliseconds since last full second"
    shared actual Integer millis {
        return millisOfDayMinusHoursMinutes - (seconds * ms.perSecond);
    }

    doc "Number of seconds since last midnight"
    shared actual Integer secondsOfDay {
        return millisOfDay / ms.perSecond;
    }

    shared actual Integer seconds {
        return millisOfDayMinusHoursMinutes / ms.perSecond;
    }

    doc "Number of minutes since last midnight"
    shared actual Integer minutesOfDay {
        return secondsOfDay / sec.perMinute;
    }

    doc "Number of minutes since last full hour."
    shared actual Integer minutes {
        return millisOfDayMinusHours / ms.perMinute;
    }

    doc "Number of full hours elapsed since last midnight."
    shared actual Integer hours {
        return millisOfDay / ms.perHour;
    }

    doc "Compare two instants of time"
    shared actual Comparison compare(Time other) {
        return millisOfDay <=> other.millisOfDay;
    }

    doc "Previous second"
    shared actual Time predecessor {
        return minusSeconds(1);
    }

    doc "Next second"
    shared actual Time successor {
        return plusSeconds(1);
    }

    doc "Returns standard extended ISO format of the time"
    shared actual String string {
        return "``leftPad(hours)``:``leftPad(minutes)``:``leftPad(seconds)``.``leftPad(millis, "0000")``";
    }

    shared actual Time minusHours(Integer hours) {
        return plusHours(-hours);
    }

    shared actual Time minusMilliseconds(Integer milliseconds) {
        return plusMilliseconds(-milliseconds);
    }

    shared actual Time minusMinutes(Integer minutes) {
        return plusMinutes(-minutes);
    }

    shared actual Time minusSeconds(Integer seconds) {
        return plusSeconds(-seconds);
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

        return normalizedTime( hours, minutes, seconds, this.millis + milliseconds);
    }

    shared actual Time plusMinutes(Integer minutes) {
        if (minutes == 0) {
            return this;
        }
        return normalizedTime( hours, this.minutes + minutes, seconds, millis );
    }

    shared actual Time plusSeconds(Integer seconds) {
        if (seconds == 0) {
            return this;
        }

        return normalizedTime( hours, minutes , this.seconds + seconds, millis );
    }

    shared actual Time withHours(Integer hours) {
        if (this.hours == hours) {
            return this;
        }
        timeCheck.checkHour(hours);
        return time(hours, minutes, seconds, millis);
    }

    shared actual Time withMinutes(Integer minutes) {
        if (this.minutes == minutes) {
            return this;
        }

        timeCheck.checkMinute(minutes);
        return time(hours, minutes, seconds, millis);
    }
    shared actual Time withSeconds(Integer seconds) {
        if (this.seconds == seconds) {
            return this;
        }

        timeCheck.checkSecond(seconds);
        return time(hours, minutes, seconds, millis );
    }
    shared actual Time withMilliseconds(Integer milliseconds) {
        if (this.millis == milliseconds) {
            return this;
        }

        timeCheck.checkMillisecond(milliseconds);
        return time(hours, minutes, seconds, milliseconds);
    }

    shared actual Boolean equals( Object other ) {
        if ( is TimeOfDay other ) {
            return millisOfDay == other.millisOfDay;
        }
        return false;
    }

    Integer millisOfDayMinusHours {
        return millisOfDay - ( hours * ms.perHour );
    }

    Integer millisOfDayMinusHoursMinutes {
        return millisOfDayMinusHours - (minutes * ms.perMinute);
    }

}
