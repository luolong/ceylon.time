import ceylon.time.base { ReadableTime, TimeBehavior, h=hours, min=minutes, sec=seconds, ms=milliseconds }
import ceylon.time.impl { TimeOfDay }

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
        satisfies ReadableTime 
                & TimeBehavior<Time>
                & Comparable<Time>
                & Ordinal<Time> {

}

doc "Create new instance of [[Time]]"
shared Time time(Integer hours = 0, Integer minutes=0, Integer seconds=0, Integer millis=0) {
    value hourRange = h.perDay;
    value milliOfHourRange = ms.perHour;
    
    value hh = (hours == 0) then 0
          else (hours %  hourRange) * milliOfHourRange;
    
    value minutesRange = min.perHour;
    value milliOfMinuteRange = ms.perMinute;
    
    value mm = (minutes == 0) then 0
          else (minutes % minutesRange) * milliOfMinuteRange;
    
    value secondRange = sec.perMinute;
    value milliOfSecondRange = ms.perSecond;
    
    value ss = (seconds == 0) then 0
          else (seconds % secondRange) * milliOfSecondRange;
    
    value totalMillis = hh + mm + ss + millis;
    return TimeOfDay( (totalMillis >= 0 ) then totalMillis
            else ( ( ms.perDay ) + totalMillis ) );
}
