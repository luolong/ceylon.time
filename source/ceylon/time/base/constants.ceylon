import ceylon.time.math { floorDiv }

doc "Common properties of _year_ unit"
shared object years {
    doc "The minimum supported year for instances of `Date`, -999,999,999."
    shared Integer minimum = -999_999_999;

    doc "The maximum supported year for instances of `Date`, 999,999,999."
    shared Integer maximum = 999_999_999;
}

doc "Common properties and limits on months"
shared object months {

    doc "Ordered list of all months of Gregorian and Julian calendar system from January to December"
    shared Month[] all = [january, february, march, april, may, june, july, august, september, october, november, december];

    doc "Number of months per year"
    shared Integer perYear = all.size;

}

doc "Common properties of _day_ unit"
shared object days {

    doc "Returns the number of days per year"
     doc "Returns the number of days per year"
    shared Integer perYear(Boolean leapYear=false) => leapYear then 366 else 365;

    doc "Returns the number of days per month"
    shared Integer perMonth(Month month, Boolean leapYear=false) => month.numberOfDays(leapYear);


    doc "Returns the number of days from the start of the year to the first of the month"
    shared Integer toMonth(Month month, Boolean leapYear=false) => month.fisrtDayOfYear(leapYear) - 1;

    doc "Number of days per week (7)"
    shared Integer perWeek = 7;

    doc "The number of days in a 400 year cycle."
    shared Integer perCycle = 146097;

    doc "The number of days from year zero to year 1970.
         There are five 400 year cycles from year zero to 2000.
         There are 7 leap years from 1970 to 2000."
    shared Integer toEpoch => (perCycle * 5) - (30 * 365 + 7);

    doc "Number of days in four years"
    shared Integer inFourYears = 1461;

    doc "Number of of per century (100 years)"
    shared Integer perCentury = 36524;

    shared Integer perFourCenturies => perCycle;

    shared Integer fromMillis( Integer millis = 0) => floorDiv(millis, milliseconds.perDay);

}

doc "Common properties of _hour_ time unit"
shared object hours {

    doc "number of hours per day"
    shared Integer perDay = 24;

}

doc "Common properties of _minute_ time unit"
shared object minutes {

    doc "Number of minutes per hour"
    shared Integer perHour = 60;

    doc "Number of minutes per day"
    shared Integer perDay => hours.perDay * minutes.perHour;
}

doc "Common properties of _second_ time unit"
shared object seconds {

    doc "Number of seconds per minute"
    shared Integer perMinute = 60;

    doc "Number of seconds per hour"
    shared Integer perHour => minutes.perHour * seconds.perMinute;

    doc "Number of seconds per day"
    shared Integer perDay => hours.perDay * seconds.perHour;
}

doc "Common properties of _millisecond_ time unit"
shared object milliseconds {

    doc "Number of milliseconds per second (1000)"
    shared Integer perSecond = 1000;

    doc "Milliseconds per minute (60000)"
    shared Integer perMinute => seconds.perMinute * milliseconds.perSecond;

    doc "Number of milliseconds per hour"
    shared Integer perHour => minutes.perHour * milliseconds.perMinute;

    doc "Number of milliseconds per day"
    shared Integer perDay =>  hours.perDay * milliseconds.perHour;
}
