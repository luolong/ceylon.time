import ceylon.time { dateTimeImpl=dateTime, dateImpl = date }
import ceylon.time.base { ReadableInstant, milliseconds }
import ceylon.time.timezone { TimeZone, ZoneDateTime }
import ceylon.time.chronology { epoch }
import ceylon.time.impl { normalizedTime }

doc "Obtains the current instant from the system clock."
shared Instant now(Clock? clock = null) {
    if (exists clock) {
        return clock.instant();
    }
    return systemTime.instant();
}

doc "A specific instant of time on a continuous time-scale.
     
     An instant represents a single point in time irrespective of 
     any time-zone offsets or geographical locations"
shared class Instant(millis) 
    satisfies ReadableInstant & Comparable<Instant> {

    doc "Internal value of an instant as a number of milliseconds since january 1st 1970 UTC"
    shared actual Integer millis;

    doc "Adds a period to this instant"
    shared Instant plus(Duration|Period other){
        switch(other)
        case(is Duration){
            return Instant(this.millis + other.millis);
        }
        case(is Period){
            return dateTime().plus(other).instant();
        }
    }

    doc "Subtracts a period to this instant"
    shared Instant minus(Duration|Period other){
        switch(other)
        case(is Duration){
            return Instant(this.millis - other.millis);
        }
        case(is Period){
            return dateTime().minus(other).instant();
        }
    }

    shared actual Comparison compare(Instant other) {
        return millis <=> other.millis;
    }

    doc "Returns DateTime value for this instant."
    shared DateTime dateTime(
            doc "Time zone of the conversion.
                 If omitted the current/default time zone of the system will be used."
            TimeZone? zone = null ) {
        if (exists zone){
            //TODO: get [[DateTime]] for this [[Instant]] in the specified time zone. 
            return nothing;
        }
        return  dateTimeImpl(epoch.date[0],epoch.date[1],epoch.date[2]).plusMilliseconds(millis);
    }

    doc "Returns a Date value for this instant"
    shared Date date(TimeZone? zone = null) {
        if (exists zone) {
            //TODO: get [[Date]] of this [[Instant]] in the specified time zone.
            return nothing;
        }

        value inDays = millis / milliseconds.perDay;
        return dateImpl(*epoch.date).plusDays(inDays);
    }

    doc "Returns a Time (time of day) value for this instant."
    shared Time time(TimeZone? zone = null) {
        if (exists zone) {
            //TODO: get [[Time]] of this [[Instant]] in the specified time zone.
            return nothing;
        }
        return normalizedTime( 0, 0, 0, millis % milliseconds.perDay );
    }

    doc "Returns ZoneDateTime value for this instant."
    shared ZoneDateTime zoneDateTime(TimeZone zone){
        //TODO: get [[Time]] of this [[Instant]] in the specified time zone.
        return nothing;
    }

    doc "Returns duration in milliseconds from this instant to the other instant."
    shared Duration durationTo(Instant other) {
        return Duration(other.millis - this.millis);
    }
    
    doc "Returns duration in milliseconds from other instant to this instant."
    shared Duration durationFrom(Instant other) {
        return Duration(this.millis - other.millis);
    }

}
