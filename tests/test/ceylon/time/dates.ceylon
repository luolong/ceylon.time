import ceylon.time { Date, date, today, now }
import ceylon.time.base { december, monday, january, november, february, DayOfWeek, wednesday, thursday, tuesday }

import com.redhat.ceylon.sdk.test { assertTrue, assertNotNull, assertEquals, assertFalse }

Date data_1982_12_13 = date( 1982, december, 13);

shared void testDates() {
    
    print("Testing GregorianCalendar Instances");
    assertDate(1982, 12, 13, monday);
    assertDate(2012, 1, 1, monday);
    assertDate(2012, 2, 29, wednesday);
    assertDate(2012, 3, 1, thursday);
    assertDate(2011, 2, 28, monday);
    assertDate(2011, 3, 1, tuesday);
    assertDate(2011, 3, 31, thursday);
    //assertEquals( 13, data_1982_12_13.day );
    //assertEquals( monday, data_1982_12_13.weekday );
    //assertEquals( 347, data_1982_12_13.dayOfYear );
    //assertTrue( data_1982_12_13.dayOfEra == 724197 ); // i dont know if its correct (or useful as a public api)

    print("Testing leapYear");
    assertTrue( date(2012, january, 1 ).leapYear, "2012 is leap year" );
    assertTrue( date(2008, january, 1 ).leapYear, "2008 is leap year" );
    assertFalse( date(2011, january, 1 ).leapYear, "2011 is not leap year" );
    assertFalse( date(1900, january, 1 ).leapYear, "1900 is not leap year" );
    assertTrue( date(2000, january, 1 ).leapYear, "2000 is leap year" );

    print( "Testing plusDays");
    assertTrue( data_1982_12_13.plusDays( 5 )  <=> date( 1982, december, 18 ) == equal );
    assertTrue( data_1982_12_13.plusDays( 5 )  <=> date( 1982, december, 18 ) == equal );
    assertTrue( data_1982_12_13.plusDays( 45 ) <=> date( 1983, january, 27 )  == equal );

    print( "Testing minusDays");
    assertTrue( data_1982_12_13.minusDays( 5 ) <=> date( 1982, december, 8 ) == equal );

    print( "Testing plusMonths");
    assertTrue( data_1982_12_13.plusMonths(1) <=> date( 1983, january, 13) == equal );
    assertTrue( data_1982_12_13.plusMonths(12) <=> date( 1983, december, 13) == equal );

    print( "Testing minusMonths");
    assertTrue( data_1982_12_13.minusMonths(1) <=> date( 1982, november, 13) == equal );
    assertTrue( data_1982_12_13.minusMonths(12) <=> date( 1981, december, 13) == equal );

    print( "Testing plusYears");
    assertTrue( data_1982_12_13.plusYears(18) <=> date( 2000, december, 13) == equal );
    assertTrue( data_1982_12_13.plusYears(30) <=> date( 2012, december, 13) == equal );
    assertTrue( date(2012, february, 29).plusYears(1) <=> date( 2013, february, 28) == equal );

    print( "Testing minusYears");
    assertTrue( data_1982_12_13.minusYears(10) <=> date( 1972, december, 13) == equal );
    assertTrue( date(2012, february, 29).minusYears(1) <=> date( 2011, february, 28) == equal );

    print( "Testing plusWeeks");
    assertTrue( data_1982_12_13.plusWeeks(1) <=> date( 1982, december, 20) == equal );
    assertTrue( data_1982_12_13.plusWeeks(3) <=> date( 1983, january, 3) == equal );

    print( "Testing minusWeeks");
    assertTrue( data_1982_12_13.minusWeeks(1) <=> date( 1982, december, 6) == equal );
    assertTrue( data_1982_12_13.minusWeeks(3) <=> date( 1982, november, 22) == equal );

    print( "Testing withDay");
    assertTrue( data_1982_12_13.withDay(17) <=> date( 1982, december, 17) == equal);
    assertTrue( data_1982_12_13.withDay(40) <=> date( 1982, december, 31) == equal);

    print( "Testing withMonth");
    assertTrue( data_1982_12_13.withMonth(january) <=> date( 1982, january, 13) == equal);
    assertTrue( date(2012, december, 31).withMonth(february) <=> date( 2012, february, 29) == equal);

    print( "Testing withYear");
    assertTrue( data_1982_12_13.withYear(2000) <=> date( 2000, december, 13) == equal);

    print( "Testing Ordinal");
    Date data_1983_01_01 = date( 1983, january, 1 );
    variable Integer cont := 0;
    for ( Date date in data_1982_12_13..data_1983_01_01 ) {
        assertTrue( date == data_1982_12_13.plusDays(cont++) );
    }

    print( "Testing string");
    assertTrue( data_1982_12_13.string == "1982-12-13" );
    assertTrue( date(2012, january, 1 ).string == "2012-01-01" );

}

void assertDate(Integer year, Integer month, Integer day, DayOfWeek weekday){
    value actual = date(year, month, day);
    assertEquals(year, actual.year);
    assertEquals(month, actual.month.integer);
    assertEquals(day, actual.day);
    assertEquals(weekday, actual.weekday);
}