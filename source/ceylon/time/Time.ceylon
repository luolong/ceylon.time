import ceylon.time.base { ReadableTime, TimeBehavior, h=hours, min=minutes, sec=seconds, ms=milliseconds }
import ceylon.time.impl { TimeOfDay }
import ceylon.time.chronology { timeCheck = time }

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
        satisfies ReadableTime 
                & TimeBehavior<Time>
                & Comparable<Time>
                & Ordinal<Time> {

}

doc "Create new instance of [[Time]]"
shared Time time(Integer hours = 0, Integer minutes=0, Integer seconds=0, Integer millis=0) {
    timeCheck.checkTime( hours, minutes, seconds, millis );

    value hh = (hours == 0) then 0
          else (hours %  h.perDay) * ms.perHour;
    
    value mm = (minutes == 0) then 0
          else (minutes % min.perHour) * ms.perMinute;
    
    value ss = (seconds == 0) then 0
          else (seconds % sec.perMinute) * ms.perSecond;
    
    value totalMillis = hh + mm + ss + millis;
    return TimeOfDay( (totalMillis >= 0 ) then totalMillis
            else ( ( ms.perDay ) + totalMillis ) );
}
