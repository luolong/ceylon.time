import ceylon.time.base { ReadableTime, TimeBehavior, h=hours, min=minutes, sec=seconds, ms=milliseconds, ReadableTimePeriod }
import ceylon.time.impl { TimeOfDay }
import ceylon.time.math { mod=floorMod }

doc "An abstraction of time of day like _6pm_ or _8.30am_."
shared interface Time
        satisfies ReadableTime 
                & TimeBehavior<Time>
                & Comparable<Time>
                & Ordinal<Time> {

    shared formal Time plus(ReadableTimePeriod period);

    shared formal Time minus(ReadableTimePeriod period);
}

doc "Create new instance of [[Time]]"
shared Time time(Integer? hours = null, Integer? minutes=null, Integer? seconds=null, Integer? millis=null) {
    if (exists hours, exists minutes, exists seconds, exists millis) {
        value hh = (hours == 0) then 0
              else mod(hours,  h.perDay) * ms.perHour;
        
        value mm = (minutes == 0) then 0
              else mod(minutes, min.perHour) * ms.perMinute;
        
        value ss = (seconds == 0) then 0
              else mod(seconds, sec.perMinute) * ms.perSecond;
        
        value totalMillis = hh + mm + ss + millis;
        return TimeOfDay( (totalMillis >= 0 ) then totalMillis
                else ( ( ms.perDay ) + totalMillis ) );
    }
    
    value _now = now().time();
    return time {
        hours = hours else _now.hours;
        minutes = minutes else _now.minutes;
        seconds = seconds else _now.seconds;
        millis = millis else _now.millis;
    };
}
