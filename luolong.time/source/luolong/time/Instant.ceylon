import luolong.time.period { Period }

doc "Obtains the current instant from the system clock."
shared Instant now(Clock? clock = null) {
	if (exists clock) {
		return clock.instant();
	}
	return systemUTC().instant();
}

doc "A specific instant of time on a continuous time-scale.
    
     An instant represents a single point in time irrespective of 
     any time-zone offsets or geographical locations"
     
shared class Instant(milliseconds) 
	satisfies Comparable<Instant> {
	
	doc "Internal value of an instant as a number of milliseconds since january 1st 1974 UTC"
	shared Integer milliseconds;
	
	doc "Adds a period to this instant"
	shared Instant plus(Duration|Period other){
		switch(other)
		case(is Duration){
			return Instant(this.milliseconds + other.milliseconds);
		}
		case(is Period){
			return this.plus(other.durationFrom(this));
		}
	}
	
	shared actual Comparison compare(Instant other) {
		return milliseconds.compare(other.milliseconds);
	}
	
	shared LocalDateTime asLocalDateTime() {
		return LocalDateTime();
	}
}
