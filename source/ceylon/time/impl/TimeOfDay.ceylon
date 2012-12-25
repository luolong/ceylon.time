import ceylon.time {Time, time}
import ceylon.time.field { millisecondsField = milliseconds, secondsField = seconds, minutesField = minutes, hoursField = hours }
doc "Extremely simple implementation of Time interface, representing an 
     abstraction of a _time of day_ such as 10am or 3.20pm."
shared class TimeOfDay(millisOfDay) 
       satisfies Time {

    doc "Number of milliseconds since last midnight"
    shared actual Integer millisOfDay;

    doc "Number of milliseconds since last full second"
    shared actual Integer millis {
        return millisOfDay % millisecondsField.perSecond;
    }

    doc "Number of seconds since last midnight"
    shared actual Integer secondsOfDay {
        return millisOfDay / millisecondsField.perSecond;
    }

    shared actual Integer seconds {
        return secondsOfDay % secondsField.perMinute;
    }

    doc "Number of minutes since last midnight"
    shared actual Integer minutesOfDay {
        return secondsOfDay / secondsField.perMinute;
    }

    doc "Number of minutes since last full hour."
    shared actual Integer minutes {
        return minutesOfDay % minutesField.perHour; 
    }

    doc "Number of full hours elapsed since last midnight."
    shared actual Integer hours {
        return minutesOfDay / minutesField.perHour;
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
        return plusHours(-(hours % hoursField.perDay));
    }

    shared actual Time minusMilliseconds(Integer milliseconds) {
        return plusMilliseconds( -( milliseconds % millisecondsField.perDay ) );
    }

    shared actual Time minusMinutes(Integer minutes) {
        return plusMinutes(-(minutes % minutesField.perDay ));
    }

    shared actual Time minusSeconds(Integer seconds) {
        return plusSeconds(-(seconds % secondsField.perDay));
    }

    shared actual Time plusHours(Integer hours) {
        if (hours == 0) {
            return this;
        }

        Integer newHour = ((hours % hoursField.perDay) + this.hours + hoursField.perDay) % hoursField.perDay;
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

        Integer minutesPerHour = minutesField.perHour;
        Integer minutesPerDay = minutesField.perDay;

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

        Integer secondsPerHour = secondsField.perHour;
        Integer secondsPerDay = secondsField.perDay;
        Integer secondsPerMinute = secondsField.perMinute;
        Integer minutesPerHour = minutesField.perHour;

        Integer secondsOfDay = hours * secondsPerHour +
                    minutes * secondsPerMinute + this.seconds;
        Integer newSofd = ((seconds % secondsPerDay) + secondsOfDay + secondsPerDay) % secondsPerDay;
        if (secondsOfDay == newSofd) {
            return this;
        }

        Integer newHour = newSofd / secondsPerHour;
        Integer newMinute = (newSofd / secondsPerMinute) % minutesPerHour;
        Integer newSecond = newSofd % secondsPerMinute;
        return time(newHour, newMinute, newSecond, millis);
    }

    shared actual Time withHours(Integer hours) {
        if (this.hours == hours) {
            return this;
        }
        hoursField.checkValidValue(hours);
        return time(hours, minutes, seconds, millis);
    }
    shared actual Time withMinutes(Integer minutes) {
        if (this.minutes == minutes) {
            return this;
        }
        minutesField.checkValidValue(minutes);
        return time(hours, minutes, seconds, millis);
    }
    shared actual Time withSeconds(Integer seconds) {
        if (this.seconds == seconds) {
            return this;
        }
        secondsField.checkValidValue(seconds);
        return time(hours, minutes, seconds, millis );
    }
    shared actual Time withMilliseconds(Integer milliseconds) {
        if (this.millis == milliseconds) {
            return this;
        }
        millisecondsField.checkValidValue(milliseconds);
        return time(hours, minutes, seconds, milliseconds);
    }

    shared actual Boolean equals( Object other ) {
        if ( is TimeOfDay other ) {
            return millisOfDay == other.millisOfDay;
        }
        return false;
    }

}
