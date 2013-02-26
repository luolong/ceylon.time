shared object years {
    doc "The minimum supported year for instances of `Date`, -999,999,999."
    shared Integer minimum = -999_999_999;

    doc "The maximum supported year for instances of `Date`, 999,999,999."
    shared Integer maximum = 999_999_999;
}

shared object months {

    doc "Ordered list of all months of Gregorian and Julian calendar system from January to December"
    shared Month[] all = [january, february, march, april, may, june, july, august, september, october, november, december];

    doc "Number of months per year"
    shared Integer perYear = all.size;

}

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

    doc "Number of days per week (7)"
    shared Integer perWeek = 7;

    doc "The number of days in a 400 year cycle."
    shared Integer perCycle = 146097;

    doc "The number of days from year zero to year 1970.
         There are five 400 year cycles from year zero to 2000.
         There are 7 leap years from 1970 to 2000."
    shared Integer toEpoch = (perCycle * 5) - (30 * 365 + 7);

    doc "Number of days in four years"
    shared Integer inFourYears = 1461;

    doc "Number of of days in four years"
    shared Integer in100Years = 36524;

    doc "Number of of days in four hundred years"
    shared Integer in400Years = 146097;

    doc "Number of days from the amount of time"
    shared Integer daysFromTime(Integer hour = 0, Integer minute = 0, Integer second = 0, Integer millis = 0) {
        return millis / milliseconds.perDay +
               second / seconds.perDay +
               minute / minutes.perDay +
               hour / hours.perDay;
    }

}

doc "Common properties of _hour_ time units"
shared object hours {

    doc "number of hours per day"
    shared Integer perDay = 24;

}

doc "Common properties of _minute_ time units"
shared object minutes {

    doc "Number of minutes per hour"
    shared Integer perHour = 60;

    doc "Number of minutes per day"
    shared Integer perDay { return  hours.perDay * minutes.perHour; }
}

doc "Properties of a second"
shared object seconds {

    doc "Number of seconds per minute"
    shared Integer perMinute = 60;

    doc "Number of seconds per hour"
    shared Integer perHour { return minutes.perHour * seconds.perMinute; }

    doc "Number of seconds per day"
    shared Integer perDay { return hours.perDay * seconds.perHour; }
}

doc "Millisecond properties."
shared object milliseconds {

    doc "Number of milliseconds per second (1000)"
    shared Integer perSecond = 1000;

    doc "Milliseconds per minute (60000)"
    shared Integer perMinute { return seconds.perMinute * milliseconds.perSecond; }

    doc "Number of milliseconds per hour"
    shared Integer perHour { return minutes.perHour * milliseconds.perMinute; }

    doc "Number of milliseconds per day"
    shared Integer perDay { return  hours.perDay * milliseconds.perHour; }
}