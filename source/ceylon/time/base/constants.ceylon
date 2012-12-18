doc "Common properties of days"
shared object days {

    doc "Returns the number of days per year"
    shared Integer perYear(Boolean leapYear=false){
        return leapYear then 366 else 365;
    }

    doc "Returns the number of days per month"
    shared Integer perMonth(Month month, Boolean leapYear=false){
        return month.numberOfDays(leapYear);
    }

    doc "Returns the number of days from the start of the year to the first of the month"
    shared Integer toMonth(Month month, Boolean leapYear=false){
        return month.fisrtDayOfYear(leapYear) - 1;
    }

}

doc "Common ptroperties of _hour_ time units"
shared object hours {

    doc "number of hours per day"
    shared Integer perDay = 24;

}

doc "Common properties of _minute_ time units"
shared object minutes {

    doc "Number of minutes per hour"
    shared Integer perHour = 60;

    doc "Number of minutes per day"
    shared Integer perDay = hours.perDay * minutes.perHour;
}

doc "Properties of a second"
shared object seconds {

    doc "Number of seconds per minute"
    shared Integer perMinute = 60;

    doc "Number of seconds per hour"
    shared Integer perHour = minutes.perHour * seconds.perMinute;

    doc "Number of seconds per day"
    shared Integer perDay = hours.perDay * seconds.perHour;
}

doc "Millisecond properties."
shared object milliseconds {

    doc "Number of milliseconds per second (1000)"
    shared Integer perSecond = 1000;

    doc "Milliseconds per minute (60000)"
    shared Integer perMinute = seconds.perMinute * milliseconds.perSecond;

    doc "Number of milliseconds per hour"
    shared Integer perHour = minutes.perHour * milliseconds.perMinute;

    doc "Number of milliseconds per day"
    shared Integer perDay = hours.perDay * milliseconds.perHour;
}