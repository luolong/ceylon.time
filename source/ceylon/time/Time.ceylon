import ceylon.time.base { ReadableTime, TimeBehavior }
import ceylon.time.impl { TimeOfDay }
import ceylon.time.field { milliseconds, secondsField = seconds, minutesField = minutes, hoursField = hours }

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
        satisfies ReadableTime 
                & TimeBehavior<Time>
                & Comparable<Time>
                & Ordinal<Time> {

}

doc "Create new instance of [[Time]]"
shared Time time(Integer hours = 0, Integer minutes=0, Integer seconds=0, Integer millis=0) {
    value hh = (hours == 0) then 0
          else (hours %  hoursField.integer) * milliseconds.perHour;
    
    value mm = (minutes == 0) then 0
          else (minutes % minutesField.integer) * milliseconds.perMinute;
    
    value secondRange = secondsField.integer;
    value milliOfSecondRange = milliseconds.integer;
    
    value ss = (seconds == 0) then 0
          else (seconds % secondRange) * milliOfSecondRange;
    
    value totalMillis = hh + mm + ss + millis;
    return TimeOfDay( (totalMillis >= 0 ) then totalMillis
            else ( ( milliseconds.perDay ) + totalMillis ) );
}
