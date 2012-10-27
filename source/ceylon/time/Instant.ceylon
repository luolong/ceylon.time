import ceylon.time.timezone { TimeZone, ZoneDateTime }

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
     
shared class Instant(millis) 
	satisfies Comparable<Instant> {
	
	doc "Internal value of an instant as a number of milliseconds since january 1st 1974 UTC"
	shared Integer millis;
	
	doc "Adds a period to this instant"
	shared Instant plus(Duration|Period other){
		switch(other)
		case(is Duration){
			return Instant(this.millis + other.millis);
		}
		case(is Period){
			return bottom;
			//return other.from(this);
		}
	}
	
	shared actual Comparison compare(Instant other) {
		return millis <=> other.millis;
	}
	
	doc "Returns a DateTime instance that represents date and time "
	shared DateTime dateTime(TimeZone? zone) {
		if (exists zone){
			//TODO: get [[DateTime]] for this [[Instant]] in the specified time zone. 
			return bottom;
		}
		
		//TODO: get [[DateTime]] for this [[Instant]] in the default time zone. 
		return bottom;
	}
	
	doc "Returns a date "
	shared Date date(TimeZone? zone) {
		if (exists zone) {
			//TODO: get [[Date]] of this [[Instant]] in the specified time zone.
			return bottom;
		}
		//TODO: get [[Date]] of this [[Instant]] in the default time zone.
		return bottom;
	}
	
	shared Time time(TimeZone? zone) {
		if (exists zone) {
			//TODO: get [[Time]] of this [[Instant]] in the specified time zone.
			return bottom;
		}
		//TODO: get [[Time]] of this [[Instant]] in the default time zone.
		return bottom;
	}
	
	shared ZoneDateTime zoneDateTime(TimeZone zone){
		//TODO: get [[Time]] of this [[Instant]] in the specified time zone.
		return bottom;		
	}
}
