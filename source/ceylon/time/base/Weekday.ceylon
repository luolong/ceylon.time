doc "A day of week, such as 'tuesday'."
shared abstract class Weekday(integer)
       of monday | tuesday | wednesday | thursday | friday | saturday | sunday
       satisfies Ordinal<Weekday> & Comparable<Weekday> {

    doc "Numeric value of the weekday"
    shared Integer integer;

    doc "Returns a day of week that comes specified number of days after this weekday"
    shared Weekday plusDays(Integer number){
        value wd = (integer + number) % 7;
        assert (exists dow = weekdays[wd]);
        return dow;
    }

    doc "Returns a day of week that comes number of days before this weekday"
    shared Weekday minusDays(Integer number){
        return plusDays(-number);
    }

    doc "Compare days of week"
    shared actual Comparison compare(Weekday other) {
        return this.integer <=> other.integer;
    }

}

doc "List of all available weekdays"
shared Weekday[] weekdays = [ sunday, monday, tuesday, wednesday, thursday, friday, saturday ];

shared Weekday weekday(Integer|Weekday weekday){
    switch(weekday)
    case (is Weekday) { return weekday; }
    case (is Integer) {
        assert (0 <= weekday && weekday < 7);
        assert (exists Weekday dow = weekdays[weekday]);
        return dow;
    }
}

doc "An exception that is thrown when parsing a weekday fails"
shared class WeekdayParseError(String message)
       extends Exception(message) {}

doc "Parses a string into a weekday"
shared Weekday parseWeekday(String weekday){
    value wd = weekday.lowercased;
    for (dow in weekdays) {
        if (dow.string.lowercased == wd) {
            return dow;
        }
    }

    throw WeekdayParseError("Unrecognized weekday: ``weekday`` ." );
}


shared object sunday extends Weekday(0) {
    shared actual String string = "sunday";
    shared actual Weekday predecessor { return  saturday; }
    shared actual Weekday successor { return monday; }
}

shared object monday extends Weekday(1) {
    shared actual String string = "monday";
    shared actual Weekday predecessor { return sunday; }
    shared actual Weekday successor { return tuesday; }
}

shared object tuesday extends Weekday(2) {
    shared actual String string = "tuesday";
    shared actual Weekday predecessor { return monday; }
    shared actual Weekday successor { return wednesday; }
}

shared object wednesday extends Weekday(3) {
    shared actual String string = "wednesday";
    shared actual Weekday predecessor { return tuesday; }
    shared actual Weekday successor { return thursday; }
}

shared object thursday extends Weekday(4) {
    shared actual String string = "thursday";
    shared actual Weekday predecessor { return wednesday; }
    shared actual Weekday successor { return friday; }
}

shared object friday extends Weekday(5) {
    shared actual String string = "friday";
    shared actual Weekday predecessor { return thursday; }
    shared actual Weekday successor { return saturday; }
}

shared object saturday extends Weekday(6) {
    shared actual String string = "saturday";
    shared actual Weekday predecessor { return friday; }
    shared actual Weekday successor { return sunday; }
}
