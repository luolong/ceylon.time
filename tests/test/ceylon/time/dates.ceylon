import ceylon.time { date, Date, Period }
import ceylon.time.base { december, monday, january, november, february, march, april, DayOfWeek, wednesday, thursday, tuesday }

import ceylon.test { assertEquals, assertTrue, assertFalse }

shared void testDates() {

    value data_1900_1_1 = date(1900, january, 1);
    value data_2000_01_31 = date( 2000, january, 31 );
    value data_1982_12_13 = date( 1982, december, 13);

    print("Testing GregorianCalendar Instances");
    assertEquals( data_1982_12_13.dayOfYear, 347 );
    assertEquals( data_1982_12_13.day, 13 );
    assertEquals( data_1982_12_13.dayOfEra, 724197 );
    assertEquals( data_1982_12_13.weekday, monday );
    assertEquals( data_1982_12_13.month, december );
    assertEquals( data_1982_12_13.year, 1982 );
    assertEquals( data_1982_12_13.weekOfYear, 50 );

    assertEquals( data_1900_1_1.dayOfYear, 1 );
    assertEquals( data_1900_1_1.day, 1 );
    assertEquals( data_1900_1_1.dayOfEra, 693901 ); 
    assertEquals( data_1900_1_1.weekday, monday );
    assertEquals( data_1900_1_1.month, january );
    assertEquals( data_1900_1_1.year, 1900 );
    assertEquals( data_1900_1_1.weekOfYear, 1 );
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
    assertEquals( date(2400, january, 1 ).leapYear, true );
    assertEquals( date(2200, january, 1 ).leapYear, false );
    assertEquals( date(2100, january, 1 ).leapYear, false );
    assertEquals( date(2012, january, 1 ).leapYear, true );
    assertEquals( date(2011, january, 1 ).leapYear, false );
    assertEquals( date(2008, january, 1 ).leapYear, true );
    assertEquals( date(2000, january, 1 ).leapYear, true );
    assertEquals( date(1900, january, 1 ).leapYear, false );
    assertEquals( date(1600, january, 1 ).leapYear, true );

    print("Testing weekOfYear");
    //Random dates
    assertEquals( date(2009, april, 28).weekOfYear, 18);
    assertEquals( date(2012, december, 16).weekOfYear, 50);

    //http://en.wikipedia.org/wiki/ISO_week_date
    //http://www.personal.ecu.edu/mccartyr/isowdcal.html
    assertEquals( date(2005, january, 1).weekOfYear, 53);
    assertEquals( date(2005, january, 2).weekOfYear, 53);
    assertEquals( date(2005, december, 31).weekOfYear, 52);
    assertEquals( date(2007, january, 1).weekOfYear, 1);
    assertEquals( date(2007, december, 30).weekOfYear, 52);
    assertEquals( date(2007, december, 31).weekOfYear, 1);
    assertEquals( date(2008, january, 1).weekOfYear, 1);
    assertEquals( date(2008, december, 28).weekOfYear, 52);
    assertEquals( date(2008, december, 29).weekOfYear, 1);
    assertEquals( date(2008, december, 30).weekOfYear, 1);
    assertEquals( date(2008, december, 31).weekOfYear, 1);
    assertEquals( date(2009, january, 1).weekOfYear, 1);
    assertEquals( date(2009, december, 31).weekOfYear, 53);
    assertEquals( date(2010, january, 1).weekOfYear, 53);
    assertEquals( date(2010, january, 2).weekOfYear, 53);
    assertEquals( date(2010, january, 3).weekOfYear, 53);
    assertTrue( date(2012, january, 1 ).leapYear, "2012 is leap year" );
    assertTrue( date(2008, january, 1 ).leapYear, "2008 is leap year" );
    assertFalse( date(2011, january, 1 ).leapYear, "2011 is not leap year" );
    assertFalse( date(1900, january, 1 ).leapYear, "1900 is not leap year" );
    assertTrue( date(2000, january, 1 ).leapYear, "2000 is leap year" );

    print( "Testing plusDays");
    assertEquals( data_1982_12_13.plusDays( 0 ), data_1982_12_13 );
    assertEquals( data_1982_12_13.plusDays( 5 ), date( 1982, december, 18 ) );
    assertEquals( data_1982_12_13.plusDays( 5 ), date( 1982, december, 18 ) );
    assertEquals( data_1982_12_13.plusDays( 45 ), date( 1983, january, 27 ) );
    assertEquals( data_1982_12_13.plusDays( 10954 ), date( 2012, december, 9 ) );

    print( "Testing minusDays");
    assertEquals( data_1982_12_13.minusDays( 5 ), date( 1982, december, 8 ) );
    assertEquals( data_1982_12_13.minusDays( 0 ), data_1982_12_13 );
    assertEquals( date( 2012, december, 9 ).minusDays( 10954 ), data_1982_12_13 );

    print( "Testing plusMonths");
    assertEquals( data_1982_12_13.plusMonths(0), data_1982_12_13 );
    assertEquals( data_1982_12_13.plusMonths(1), date( 1983, january, 13) );
    assertEquals( data_1982_12_13.plusMonths(12), date( 1983, december, 13) );
    assertEquals( data_1982_12_13.plusMonths(36), date( 1985, december, 13) );

    assertEquals( data_2000_01_31.plusMonths(1), date( 2000, february, 29) );
    assertEquals( data_2000_01_31.plusMonths(14), date( 2001, march, 31) );

    print( "Testing minusMonths");
    assertEquals( data_1982_12_13.minusMonths(0), data_1982_12_13 );
    assertEquals( data_1982_12_13.minusMonths(1), date( 1982, november, 13) );
    assertEquals( data_1982_12_13.minusMonths(12), date( 1981, december, 13) );

    print( "Testing plusYears");
    assertEquals( data_1982_12_13.plusYears(0), data_1982_12_13 );
    assertEquals( data_1982_12_13.plusYears(18), date( 2000, december, 13) );
    assertEquals( data_1982_12_13.plusYears(30), date( 2012, december, 13) );
    assertEquals( date(2012, february, 29).plusYears(1), date( 2013, february, 28) );

    print( "Testing minusYears");
    assertEquals( data_2000_01_31.minusYears(1), date( 1999, january, 31) );

    assertEquals( data_1982_12_13.minusYears(10), date( 1972, december, 13) );
    assertEquals( date(2012, february, 29).minusYears(1), date( 2011, february, 28) );

    print( "Testing plusWeeks");
    assertEquals( data_1982_12_13.plusWeeks(1).weekday, data_1982_12_13.weekday );
    assertEquals( data_1982_12_13.plusWeeks(1), date( 1982, december, 20) );
    assertEquals( data_1982_12_13.plusWeeks(3), date( 1983, january, 3) );

    print( "Testing minusWeeks");
    assertEquals( data_1982_12_13.minusWeeks(1), date( 1982, december, 6) );
    assertEquals( data_1982_12_13.minusWeeks(3), date( 1982, november, 22) );
    assertEquals( data_1982_12_13.minusWeeks(3).weekday, date( 1982, november, 22).weekday );

    print( "Testing withDayOfMonth");
    assertEquals( data_1982_12_13.withDay(13), data_1982_12_13 );
    assertEquals( data_1982_12_13.withDay(17), date( 1982, december, 17) );
	
    //TODO: Should we throw exception if isnt valid day?
    assertEquals( data_1982_12_13.withDay(0), date( 1982, 11, 30 ) );
    assertEquals( data_1982_12_13.withDay(40), date( 1982, december, 31) );
    assertEquals( date(2011, february,1).withDay(29), date( 2011, february, 28) );
    //////
    print( "Testing withDay");
    assertTrue( data_1982_12_13.withDay(17) <=> date( 1982, december, 17) == equal);
    assertTrue( data_1982_12_13.withDay(40) <=> date( 1982, december, 31) == equal);

    print( "Testing withMonth");
    assertEquals( data_1982_12_13.withMonth(december), data_1982_12_13 );
    assertEquals( data_1982_12_13.withMonth(january), date( 1982, january, 13) );
    assertEquals( date(2012, december, 31).withMonth(february), date( 2012, february, 29) );
    assertTrue( data_1982_12_13.withMonth(january) <=> date( 1982, january, 13) == equal);
    assertTrue( date(2012, december, 31).withMonth(february) <=> date( 2012, february, 29) == equal);

    print( "Testing withYear");
    assertEquals( data_1982_12_13.withYear(1982), data_1982_12_13 );
    assertEquals( data_1982_12_13.withYear(2000), date( 2000, december, 13) );
    assertEquals( data_1982_12_13.withYear(1800), date( 1800, december, 13) );

    print( "Testing Ordinal");
    Date data_1983_01_01 = date( 1983, january, 1 );
    variable value cont := 0;
    for ( Date date in data_1982_12_13..data_1983_01_01 ) {
        assertEquals( date, data_1982_12_13.plusDays(cont++) );
    }

    print( "Testing plus" );
    value period_0001_02_03 = Period {
        years = 1;
        months = 2;
        days = 3;
    };
    value newDataAmount = data_1982_12_13.plus( period_0001_02_03 );
    assertEquals( newDataAmount.year, 1984 );
    assertEquals( newDataAmount.month, february );
    assertEquals( newDataAmount.day, 16 );

    print( "Testing string");
    assertEquals( data_1982_12_13.string, "1982-12-13" );
    assertEquals( date(2012, january, 1 ).string, "2012-01-01" );

}

void assertDate(Integer year, Integer month, Integer day, DayOfWeek weekday){
    value actual = date(year, month, day);
    assertEquals(year, actual.year);
    assertEquals(month, actual.month.integer);
    assertEquals(day, actual.day);
    assertEquals(weekday, actual.weekday);
}
