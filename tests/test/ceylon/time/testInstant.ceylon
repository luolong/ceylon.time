import ceylon.test { assertEquals }
import ceylon.time { now, Instant, fixedTime, Clock, date, Period }
import ceylon.time.base { february, march, january }

//Wed Feb 13 14:00:42.0057 BOT 2013
Clock clock = fixedTime(1360778442057);
Instant feb_13_2013_14_00_42_0057 = now( clock );

shared void testDate() => assertEquals( feb_13_2013_14_00_42_0057.date(), date(2013, february, 13) );

shared void testPlusPeriod() {
    value period = Period { years = 2; months = 1;};
	value actual = feb_13_2013_14_00_42_0057.plus(period);
	assertEquals(date(2015,march, 13), actual.date() );
}

shared void testMinusPeriod() {
	value period = Period { years = 2; months = 1; days = 3;};
	value actual = feb_13_2013_14_00_42_0057.minus(period);
	assertEquals(date(2011,january, 10), actual.date() );
}

shared void testDateTime() {
    // Wrong hour because we dont have TimeZone
    //assertEquals( instant.dateTime(), dateTime(2013, february, 13, 14 , 0, 42, 57) );
}

shared void testTime() {
    // Wrong hour because we dont have TimeZone
    //assertEquals( instant.time(), time( 14 , 0, 42, 57) );
}
