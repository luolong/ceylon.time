import ceylon.time { Time }
doc "Extremely simple implementation of Time interface, representing an 
     abstraction of a _time of day_ such as 10am or 3.20pm."
shared class TimeOfDay(millisOfDay) 
	satisfies Time{

	doc "Number of milliseconds since last midnight"
	shared actual Integer millisOfDay;
	
	doc "Number of milliseconds since last full second"
	shared actual Integer millis {
		return millisOfDay % ( milliOfSecond.range().getMaximum() + 1 );
	}

	doc "Number of seconds since last midnight"
	shared actual Integer secondsOfDay {
		return millisOfDay / ( milliOfSecond.range().getMaximum() + 1 );
	}

	shared actual Integer seconds {
		return secondsOfDay % ( secondOfMinute.range().getMaximum() + 1 );
	}

	doc "Number of minutes since last midnight"
	shared actual Integer minutesOfDay {
		return secondsOfDay / ( secondOfMinute.range().getMaximum() + 1 );
	}
	
	doc "Number of minutes since last full hour."
	shared actual Integer minutes {
		return minutesOfDay % minuteOfHour.range().getMaximum() + 1; 
	}

	doc "Number of full hours elapsed since last midnight."
	shared actual Integer hours {
		return minutesOfDay / minuteOfHour.range().getMaximum() + 1;
	}
	
	doc	"Compare two instants of time"
	shared actual Comparison compare(Time other) {
		return millisOfDay <=> other.millisOfDay;
	}
		
	doc "Previous millisecond"
	shared actual Time predecessor {
		return minusSeconds(1);
	}
	
	doc "Next millisecond"
	shared actual Time successor {
		return plusSeconds(1);
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
