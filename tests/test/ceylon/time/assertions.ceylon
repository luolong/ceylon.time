import ceylon.time.base { Month, DayOfWeek }
import ceylon.time { date, dateTime, time, Time }
import ceylon.test { assertEquals }

shared Boolean same(Object? expected, Object? actual) {
    if (is Identifiable expected, is Identifiable actual) {
        return expected == actual;
    }
    return false;
}

void assertGregorianDate(Integer year, Month month, Integer day, DayOfWeek weekday, Boolean leapYear = false, Integer? dayOfYear = null ) {
    value actual = date(year, month, day);
    assertEquals(year, actual.year);
    assertEquals(month, actual.month);
    assertEquals(day, actual.day);
    assertEquals(weekday, actual.weekday);
    assertEquals(leapYear, actual.leapYear);

    if ( exists dayOfYear ) {
        assertEquals(dayOfYear, actual.dayOfYear);
    }
}

void assertGregorianDateTime( Integer year, Month month, Integer day, DayOfWeek weekday, Boolean leapYear = false, 
                              Integer hour = 0, Integer minute = 0, Integer second = 0, Integer milli = 0) {
    value actual = dateTime(year, month, day, hour, minute, second, milli);
    assertEquals(year, actual.year);
    assertEquals(month, actual.month);
    assertEquals(day, actual.day);
    assertEquals(weekday, actual.weekday);
    assertEquals(leapYear, actual.leapYear);
    assertEquals(hour, actual.hours);
    assertEquals(minute, actual.minutes);
    assertEquals(second, actual.seconds);
    assertEquals(milli, actual.millis);
}

shared void assertTime( Integer hour = 0, Integer minute = 0, Integer second = 0, Integer milli = 0, Integer secondsOfDay = 0, Integer minutesOfDay = 0) {
    Time actual = time( hour, minute, second, milli );
    assertEquals { expected = hour; actual = actual.hours; };
    assertEquals { expected = minute; actual = actual.minutes; };
    assertEquals { expected = second; actual = actual.seconds; };
    assertEquals { expected = milli; actual = actual.millis; };
    assertEquals { expected = secondsOfDay; actual = actual.secondsOfDay; };
    assertEquals { expected = minutesOfDay; actual = actual.minutesOfDay; };
}