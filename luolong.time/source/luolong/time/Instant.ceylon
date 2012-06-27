
doc "Obtains the current instant from the system clock."
shared Instant now(Clock? clock = null) {
	if (exists clock) {
		return clock.instant();
	}
	return systemUTC().instant();
}

shared Instant instant(Integer seconds, Integer nanos = 0){
	return Instant(seconds, nanos);
}

shared Instant instantMillis(Integer millis){
	Integer secs = millis / 1000;
	Integer nanos = millis % 1000;
	return Instant(secs, nanos * 1000000);
}

doc "A specific instant of time on a continuous time-scale.
    
     An instant represents a single point in time irrespective of 
     any time-zone offsets or geographical locations"
     
shared class Instant(seconds, nanos) 
	satisfies Comparable<Instant> {
	
	doc "The number of seconds from 1970-01-01T00:00:00Z"
	shared Integer seconds;
	
	doc "The nanoseconds within the second, must be positive"
	shared Integer nanos;
	
	doc "Internal value of an instant as a number of milliseconds since january 1st 1974 UTC"
	shared Integer milliseconds = seconds * 1000 + nanos / 1000000;
	
	shared actual Comparison compare(Instant other) {
		return milliseconds.compare(other.milliseconds);
	}
}
