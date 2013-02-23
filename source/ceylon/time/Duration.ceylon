import ceylon.time.base { ReadableDuration }

doc "Duration specifies a discreet amount of milliseconds between two instances of time."
shared class Duration(millis) satisfies ReadableDuration {

    doc "Number of milliseconds of this duration"
    shared actual Integer millis;

    doc "Return a period based on the number of milliseconds"
    shared Period period {
        return Period { 
            milliseconds = millis; 
        }; 
    }

    doc "Returns the string representation of this duration."
    shared actual String string {
        return "``millis``ms";
    }
}
