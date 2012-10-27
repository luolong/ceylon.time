doc "Common interface for all data types that contain fileds that represent time of day."
shared interface ReadableTime {

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