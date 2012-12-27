import ceylon.time.timezone { TimeZone, ZoneDateTime }
import ceylon.time.base { ReadableInstant }

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

    doc "Internal value of an instant as a number of milliseconds since january 1st 1974 UTC"
    shared actual Integer millis;

    doc "Adds a period to this instant"
    shared Instant plus(Duration|Period other){
        switch(other)
        case(is Duration){
            return Instant(this.millis + other.millis);
        }
        case(is Period){
            return bottom;
            //return other.from(this);
        }
    }

    shared actual Comparison compare(Instant other) {
        return millis <=> other.millis;
    }

    doc "Returns DateTime value for this instant."
    shared DateTime dateTime(
            doc "Time zone of the conversion.
                 If omitted the current/default time zone of the system will be used."
            TimeZone? zone) {
        if (exists zone){
            //TODO: get [[DateTime]] for this [[Instant]] in the specified time zone. 
            return bottom;
        }
        //TODO: get [[DateTime]] for this [[Instant]] in the default time zone. 
        return bottom;
    }

    doc "Returns a Date value for this instant"
        shared Date date(TimeZone? zone) {
        if (exists zone) {
            //TODO: get [[Date]] of this [[Instant]] in the specified time zone.
            return bottom;
        }
        //TODO: get [[Date]] of this [[Instant]] in the default time zone.
        return bottom;
    }

    doc "Returns a Time (time of day) value for this instant."
    shared Time time(TimeZone? zone) {
        if (exists zone) {
            //TODO: get [[Time]] of this [[Instant]] in the specified time zone.
            return bottom;
        }
        //TODO: get [[Time]] of this [[Instant]] in the default time zone.
        return bottom;
    }

    doc "Returns ZoneDateTime value for this instant."
    shared ZoneDateTime zoneDateTime(TimeZone zone){
        //TODO: get [[Time]] of this [[Instant]] in the specified time zone.
        return bottom;		
    }
}
