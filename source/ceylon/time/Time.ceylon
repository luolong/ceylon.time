import ceylon.math.float { log10 }
import ceylon.time.base { ReadableTime, TimeBehavior }

doc "An abstraction representing time of day like _6pm_ or _8.30am_."
shared interface Time
    satisfies ReadableTime & TimeBehavior<Time> & Comparable<Time> & Ordinal<Time> {
	
}

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
	shared actual Time minusHours(Integer hours) {
		return bottom;
	}
	shared actual Time minusMilliseconds(Integer milliseconds) {
		return bottom;
	}
	shared actual Time minusMinutes(Integer minutes) {
		return bottom;
	}
	shared actual Time minusSeconds(Integer seconds) {
		return bottom;
	}
	shared actual Time normalized() {
		return bottom;
	}
	shared actual Time plusHours(Integer hours) {
		return bottom;
	}
	shared actual Time plusMilliseconds(Integer milliseconds) {
		return bottom;
	}
	shared actual Time plusMinutes(Integer minutes) {
		return bottom;
	}
	shared actual Time plusSeconds(Integer seconds) {
		return bottom;
	}
	shared actual Time withHours(Integer hours) {
		return bottom;
	}
	shared actual Time withMilliseconds(Integer milliseconds) {
		return bottom;
	}
	shared actual Time withMinutes(Integer minutes) {
		return bottom;
	}
	shared actual Time withSeconds(Integer seconds) {
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
