import ceylon.time { Duration }

doc "An abstraction of data representing a duration of time.
     
     A duration is a fixed delta of time between two instants 
     measured in number of milliseconds."
see (Duration)
by ('Diego Coronel', 'Rolend Tepp')
shared interface ReadableDuration {

    doc "Number of milliseconds."
    shared formal Integer millis;

}