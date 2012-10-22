import ceylon.math.float { log10 }

doc "Common interface for all data types that contain fileds that represent time of day."
shared interface TimeLike {
	
	doc "Number of full hours elapsed since last midnight."
	shared formal Integer hours;
	
	doc "Number of minutes since last full hour."
	shared formal Integer minutes;
	
	doc "Number of seconds since last full minute."
	shared formal Integer seconds;
	
	doc "Number of milliseconds since last full second"
	shared formal Integer millis;
	
	doc "Number of minutes since last midnight"
	shared formal Integer minutesOfDay;
	
	doc "Number of seconds since last midnight"
	shared formal Integer secondsOfDay;
	
	doc "Number of milliseconds since last midnight"
	shared formal Integer millisOfDay;
	
}

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
    satisfies TimeLike & Comparable<Time> & Ordinal<Time> {
	
}

doc "number of full hour per day"
shared Integer hoursPerDay = 24;

doc "Number of minutes in a typical day.
     Not accounting for discrepancies around DST."
shared Integer minutesPerHour = 60;

doc "Number of minutes in a typical day.
     Not accounting for discrepancies around DST."
shared Integer minutesPerDay = 1440;

doc "Number of seconds in a minute."
shared Integer secondsPerMinute = 60;

doc "Number of seconds in an hour"
shared Integer secondsPerHour = 3600;

doc "Number of seconds in an average day.
     Not accounting for discrepancies around DST
     or leap seconds."
shared Integer secondsPerDay = 86400;

doc "Number of milliseconds in a second."
shared Integer millisPerSecond = 1000;

doc "Number of milliseconds in a minute."
shared Integer millisPerMinute = 60000;

doc "Number of milliseconds in an hour."
shared Integer millisPerHour = 3600000;

doc "Number of milliseconds in an average day.
     Not accounting for discrepancies around DST
     or leap seconds."
shared Integer millisPerDay = 86400000;

doc "create new instance of Time"
shared Time time(Integer hour, Integer minutes=0, Integer seconds=0, Integer millis=0){
	value hh = (hour % hoursPerDay) * millisPerHour;
	value mm = (minutes % minutesPerHour) * millisPerMinute;
	value ss = (seconds % secondsPerMinute) * millisPerSecond;
	return TimeOfDay(hh + mm + ss + millis);
}

doc "Extremely simple implementation of Time interface, representing an 
     abstraction of a _time of day_ such as 10am or 3.20pm."
class TimeOfDay(millisOfDay) 
	satisfies Time{

	doc "Number of milliseconds since last midnight"
	shared actual Integer millisOfDay;
	
	doc "Number of milliseconds since last full second"
	shared actual Integer millis {
		return millisOfDay % millisPerSecond;
	}

	doc "Number of seconds since last midnight"
	shared actual Integer secondsOfDay {
		return millisOfDay / millisPerSecond;
	}

	shared actual Integer seconds {
		return secondsOfDay % secondsPerMinute;
	}

	doc "Number of minutes since last midnight"
	shared actual Integer minutesOfDay {
		return secondsOfDay / secondsPerMinute;
	}
	
	doc "Number of minutes since last full hour."
	shared actual Integer minutes {
		return minutesOfDay % minutesPerHour; 
	}

	doc "Number of full hours elapsed since last midnight."
	shared actual Integer hours {
		return minutesOfDay / minutesPerHour;
	}
	
	doc	"Compare two instants of time"
	shared actual Comparison compare(Time other) {
		return millisOfDay <=> other.millisOfDay;
	}
		
	doc "Previous millisecond"
	shared actual Time predecessor {
		return TimeOfDay( (millisPerDay + millisOfDay - 1) % millisPerDay);
	}
	
	doc "Next millisecond"
	shared actual Time successor {
		return TimeOfDay( (millisOfDay + 1) % millisPerDay);
	}
	
	doc "Returns standard extended ISO format of the time"
	shared actual String string {
		return "" pad(hours) ":" pad(minutes) ":" pad(seconds) "." millis "";
	}
	shared actual Integer distanceFrom(Time other) {
		return bottom;
	}
}

doc "return padded value"
String pad(Integer number, String padding = "00"){
	if (number == 0){
		return padding;
	}
	
	value digits = log10( number.magnitude.float ).wholePart.integer + 1;
	if (digits < padding.size) {
		value padded = padding.plus( number.string );
		return padded.segment(
				padded.size - padding.size,
				padding.size );
	}
	
	return number.string;
}
