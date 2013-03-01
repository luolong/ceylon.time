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
shared Time time(Integer hours = 0, Integer minutes=0, Integer seconds=0, Integer millis=0) {

    doc "Hours should be between 0 and 23"
    assert( hours >= 0 && hours < h.perDay );

    doc "Minutes should be between 0 and 59"
    assert( minutes >= 0 && minutes < min.perHour );

    doc "Seconds should be between 0 and 59"
    assert( seconds >= 0 && seconds < sec.perMinute );

    doc "Milliseconds should be between 0 and 59"
    assert( millis >= 0 && millis < ms.perSecond );

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
