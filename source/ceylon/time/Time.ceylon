import ceylon.time.base { ReadableTime, TimeBehavior }
import ceylon.time.impl { TimeOfDay, hourOfDay, minuteOfHour, secondOfMinute, milliOfSecond, milliOfMinute, milliOfHour }

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
    satisfies ReadableTime & TimeBehavior<Time> & Comparable<Time> & Ordinal<Time> {
	
}

doc "create new instance of Time"
shared Time time(Integer hour = 0, Integer minutes=0, Integer seconds=0, Integer millis=0){
	value hh = (hour % hourOfDay.range().getMaximum() + 1) * ( milliOfHour.range().getMaximum() + 1 );
	value mm = (minutes % minuteOfHour.range().getMaximum() + 1) * ( milliOfMinute.range().getMaximum() + 1 );
	value ss = (seconds % ( secondOfMinute.range().getMaximum() + 1 )) * ( milliOfSecond.range().getMaximum() + 1 );
	return TimeOfDay(hh + mm + ss + millis);
}
