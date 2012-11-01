doc "Common interface for all data types that contain fileds that represent time of day."
shared interface ReadableTime {

	doc "Number of full hours"
	shared formal Integer hours;
	
	doc "Number of minutes"
	shared formal Integer minutes;
	
	doc "Number of seconds"
	shared formal Integer seconds;
	
	doc "Number of milliseconds"
	shared formal Integer millis;
	
	doc "Number of minutes"
	shared formal Integer minutesOfDay;
	
	doc "Number of seconds"
	shared formal Integer secondsOfDay;
	
	doc "Number of milliseconds"
	shared formal Integer millisOfDay;

}