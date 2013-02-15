import ceylon.time { Time, DateTime }
import ceylon.time.timezone { ZoneDateTime }
doc "Common interface to represent time of day."
by ("Diego Coronel", "Roland Tepp")
see (Time, DateTime, ZoneDateTime)
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