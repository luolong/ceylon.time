doc "A day of week, such as 'tuesday'."
shared abstract class DayOfWeek(integer)
       of monday | tuesday | wednesday | thursday | friday | saturday | sunday
       satisfies Ordinal<DayOfWeek> & Comparable<DayOfWeek> {

    doc "Numeric value of the weekday"
    shared Integer integer;

    doc "Returns a day of week that comes specified number of days after this weekday"
    shared DayOfWeek plusDays(Integer number){
        value wd = (integer + number) % 7;
        assert (exists dow = weekdays[wd]);
        return dow;
    }

    doc "Returns a day of week that comes number of days before this weekday"
    shared DayOfWeek minusDays(Integer number){
        return plusDays(-number);
    }

    doc "Compare days of week"
    shared actual Comparison compare(DayOfWeek other) {
        return this.integer <=> other.integer;
    }

}

doc "List of all available weekdays"
shared DayOfWeek[] weekdays = [ sunday, monday, tuesday, wednesday, thursday, friday, saturday ];

shared DayOfWeek dayOfWeek(Integer|DayOfWeek weekday){
    switch(weekday)
    case (is DayOfWeek) { return weekday; }
    case (is Integer) {
        assert (0 <= weekday && weekday < 7);
        assert (exists DayOfWeek dow = weekdays[weekday]);
        return dow;
    }
}

doc "An exception that is thrown when parsing a weekday fails"
shared class WeekdayParseError(String message)
       extends Exception(message) {}

doc "Parses a string into a weekday"
shared DayOfWeek parseDayOfWeek(String weekday){
    value wd = weekday.lowercased;
    for (dow in weekdays) {
        if (dow.string.lowercased == wd) {
            return dow;
        }
    }

    throw WeekdayParseError("Unrecognized weekday: ``weekday`` ." );
}


shared object sunday extends DayOfWeek(0) {
    shared actual String string = "sunday";
    shared actual DayOfWeek predecessor { return  saturday; }
    shared actual DayOfWeek successor { return monday; }
}

shared object monday extends DayOfWeek(1) {
    shared actual String string = "monday";
    shared actual DayOfWeek predecessor { return sunday; }
    shared actual DayOfWeek successor { return tuesday; }
}

shared object tuesday extends DayOfWeek(2) {
    shared actual String string = "tuesday";
    shared actual DayOfWeek predecessor { return monday; }
    shared actual DayOfWeek successor { return wednesday; }
}

shared object wednesday extends DayOfWeek(3) {
    shared actual String string = "wednesday";
    shared actual DayOfWeek predecessor { return tuesday; }
    shared actual DayOfWeek successor { return thursday; }
}

shared object thursday extends DayOfWeek(4) {
    shared actual String string = "thursday";
    shared actual DayOfWeek predecessor { return wednesday; }
    shared actual DayOfWeek successor { return friday; }
}

shared object friday extends DayOfWeek(5) {
    shared actual String string = "friday";
    shared actual DayOfWeek predecessor { return thursday; }
    shared actual DayOfWeek successor { return saturday; }
}

shared object saturday extends DayOfWeek(6) {
    shared actual String string = "saturday";
    shared actual DayOfWeek predecessor { return friday; }
    shared actual DayOfWeek successor { return sunday; }
}
