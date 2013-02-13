import ceylon.time { now, Instant, fixedTime, Clock, date, dateTime, time }
import ceylon.time.base { february }
import ceylon.test { assertEquals }

//Wed Feb 13 14:00:42.0057 BOT 2013
Clock clock = fixedTime(1360778442057);
Instant instant = now( clock );

shared void testDate() {
	assertEquals( instant.date(), date(2013, february, 13) );
}

shared void testDateTime() {
    // Wrong hour because we dont have TimeZone
    //assertEquals( instant.dateTime(), dateTime(2013, february, 13, 14 , 0, 42, 57) );
}

shared void testTime() {
    // Wrong hour because we dont have TimeZone
    //assertEquals( instant.time(), time( 14 , 0, 42, 57) );
}
