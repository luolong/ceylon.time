import ceylon.time.base { ReadableDuration }

doc "Duration specifies a discreet amount of milliseconds between two instances of time."
shared class Duration(millis) satisfies ReadableDuration {
	
	doc "Number of milliseconds of this duration"
	shared actual Integer millis;
	
	//TODO: Add some meaning here
}