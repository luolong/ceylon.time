doc "A generic representation of Period"
shared interface ReadablePeriod 
       satisfies ReadableDatePeriod 
               & ReadableTimePeriod {

    doc "Returns a copy of this period containing only the date period fields."
    shared formal ReadableDatePeriod dateOnly;

    doc "Returns a copy of this period containing only the time period fields."
    shared formal ReadableTimePeriod timeOnly;

}

doc "A representation of period data that decribes a period of _days_, _months_ and _years_."
shared interface ReadableDatePeriod {

    doc "The number of years."
    shared formal Integer years;

    doc "The number of months"
    shared formal Integer months;

    doc "The number of days"
    shared formal Integer days;

}

doc "A representation of period data that describes a period of time."
shared interface ReadableTimePeriod {

    doc "The number of hours"
    shared formal Integer hours;

    doc "The number of minutes"
    shared formal Integer minutes;

    doc "The number of seconds"
    shared formal Integer seconds;

    doc "The number of milliseconds"
    shared formal Integer milliseconds;

}