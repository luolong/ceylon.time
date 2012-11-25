import ceylon.time.base { ReadableTime, TimeBehavior }
import ceylon.time.impl { TimeOfDay, hourPerDay, minutePerHour, secondPerMinute, milliPerSecond, milliPerMinute, milliPerHour, milliPerDay }

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
    satisfies ReadableTime & TimeBehavior<Time> & Comparable<Time> & Ordinal<Time> {
	
}

doc "create new instance of Time"
shared Time time(Integer hour = 0, Integer minutes=0, Integer seconds=0, Integer millis=0) {
	value hourRange = hourPerDay.getMaximumRepresentation();
	value milliOfHourRange = milliPerHour.getMaximumRepresentation();

	value hh = ( hour != 0 )
				then (hour %  hourRange) * milliOfHourRange
				else 0;

	value minutesRange = minutePerHour.getMaximumRepresentation();
	value milliOfMinuteRange = milliPerMinute.getMaximumRepresentation();

	value mm = ( minutes != 0 )
				then (minutes % minutesRange) * milliOfMinuteRange
				else 0;

	value secondRange = secondPerMinute.getMaximumRepresentation();
	value milliOfSecondRange = milliPerSecond.getMaximumRepresentation();

	value ss = ( seconds != 0 )
				then (seconds % secondRange) * milliOfSecondRange
				else 0;

	value totalMilli = hh + mm + ss + millis;
	return TimeOfDay( 
			(totalMilli >= 0 )
			then totalMilli
			else ( ( milliPerDay.getMaximumRepresentation() ) + totalMilli ) //In this case totalMilli is a negative number
	);
}
