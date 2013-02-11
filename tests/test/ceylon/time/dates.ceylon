import ceylon.test { assertEquals, assertTrue, assertFalse }
import ceylon.time { date, Date, Period }
import ceylon.time.base { december, monday, january, november, february, april, DayOfWeek, tuesday, Month, october, sunday, wednesday, september, july, saturday, friday }

Boolean leapYear = true;

// Table of test data from the book Calendrical Calculations
shared void test_sun_jul_24_minus586() => assertGregorianDate(-586, july, 24, sunday, !leapYear);
shared void test_wed_dec_05_minus168() => assertGregorianDate(-168, december, 5, wednesday, leapYear);
shared void test_wed_sep_24_70() => assertGregorianDate(70, september, 24, wednesday, !leapYear);

shared void test_mon_jan_01_1900() => assertGregorianDate(1900, january, 1, monday, !leapYear);
shared void test_tue_oct_29_1974() => assertGregorianDate(1974, october, 29, tuesday, !leapYear);
shared void test_mon_dec_13_1982() => assertGregorianDate(1982, december, 13, monday, !leapYear);
shared void test_mon_dec_31_1999() => assertGregorianDate(1999, december, 31, friday, !leapYear);
shared void test_mon_jan_01_2000() => assertGregorianDate(2000, january, 1, saturday, leapYear);
shared void test_mon_jan_31_2000() => assertGregorianDate(2000, january, 31, monday, leapYear);
shared void test_tue_feb_29_2000() => assertGregorianDate(2000, february, 29, tuesday, leapYear);
shared void test_sun_dec_31_2000() => assertGregorianDate(2000, december, 31, sunday, leapYear);
shared void test_wed_feb_29_2012() => assertGregorianDate(2012, february, 29, wednesday, leapYear);

shared void test_2400_is_leapYear() => assertTrue( date(2400, january, 1 ).leapYear, "2400 is leap year" );
shared void test_2200_is_not_leapYear() => assertFalse( date(2200, january, 1 ).leapYear, "2200 is not leap year" );
shared void test_2100_is_not_leapYear() => assertFalse( date(2100, january, 1 ).leapYear, "2010 is not leap year" );
shared void test_2012_is_leapYear() => assertTrue( date(2012, january, 1 ).leapYear, "2012 is leap year" );
shared void test_2011_is_not_leapYear() => assertFalse( date(2011, january, 1 ).leapYear, "2011 is not leap year" );
shared void test_2008_is_leapYear() => assertTrue( date(2008, january, 1 ).leapYear, "2008 is leap year" );
shared void test_2000_is_leapYear() => assertTrue( date(2000, january, 1 ).leapYear, "2000 is leap year" );
shared void test_1900_is_not_leapYear() => assertFalse( date(1900, january, 1 ).leapYear, "1900 is not leap year" );
shared void test_1600_is_leapYear() => assertTrue( date(1600, january, 1 ).leapYear, "1600 is leap year" );

shared void testWeekOfYear() {
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
}

shared void testDatePlusDays() {
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.plusDays( 0 ), data_1982_12_13 );
    assertEquals( data_1982_12_13.plusDays( 5 ), date( 1982, december, 18 ) );
    assertEquals( data_1982_12_13.plusDays( 5 ), date( 1982, december, 18 ) );
    assertEquals( data_1982_12_13.plusDays( 45 ), date( 1983, january, 27 ) );
    assertEquals( data_1982_12_13.plusDays( 10954 ), date( 2012, december, 9 ) );
}

shared void testDateMinusDays() {
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.minusDays( 5 ), date( 1982, december, 8 ) );
    assertEquals( data_1982_12_13.minusDays( 0 ), data_1982_12_13 );
    assertEquals( date( 2012, december, 9 ).minusDays( 10954 ), data_1982_12_13 );
}

shared void testDatePlusMonths() {
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.plusMonths(0), data_1982_12_13 );
    assertEquals( data_1982_12_13.plusMonths(1), date( 1983, january, 13) );
    assertEquals( data_1982_12_13.plusMonths(12), date( 1983, december, 13) );
    assertEquals( data_1982_12_13.plusMonths(36), date( 1985, december, 13) );

    //assertEquals( data_2000_01_31.plusMonths(1), date( 2000, february, 29) );
    //assertEquals( data_2000_01_31.plusMonths(14), date( 2001, march, 31) );
}

shared void testDateMinusMonths() {
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.minusMonths(0), data_1982_12_13 );
    assertEquals( data_1982_12_13.minusMonths(1), date( 1982, november, 13) );
    assertEquals( data_1982_12_13.minusMonths(12), date( 1981, december, 13) );
}

shared void testDatePlusYears() {
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.plusYears(0), data_1982_12_13 );
    assertEquals( data_1982_12_13.plusYears(18), date( 2000, december, 13) );
    assertEquals( data_1982_12_13.plusYears(30), date( 2012, december, 13) );
    assertEquals( date(2012, february, 29).plusYears(1), date( 2013, february, 28) );
}

shared void testDateMinusYears() {
    value data_1982_12_13 = date( 1982, december, 13);
    //assertEquals( data_2000_01_31.minusYears(1), date( 1999, january, 31) );
    assertEquals( data_1982_12_13.minusYears(10), date( 1972, december, 13) );
    assertEquals( date(2012, february, 29).minusYears(1), date( 2011, february, 28) );
}

shared void testDatePlusWeeks() {
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.plusWeeks(1).weekday, data_1982_12_13.weekday );
    assertEquals( data_1982_12_13.plusWeeks(1), date( 1982, december, 20) );
    assertEquals( data_1982_12_13.plusWeeks(3), date( 1983, january, 3) );
}

shared void testDateMinusWeeks(){
    value data_1982_12_13 = date( 1982, december, 13);
    assertEquals( data_1982_12_13.minusWeeks(1), date( 1982, december, 6) );
    assertEquals( data_1982_12_13.minusWeeks(3), date( 1982, november, 22) );
    assertEquals( data_1982_12_13.minusWeeks(3).weekday, date( 1982, november, 22).weekday );
}

shared void testDates() {
    value data_1982_12_13 = date( 1982, december, 13);
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
    variable value cont = 0;
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

void assertGregorianDate(Integer year, Month month, Integer day, DayOfWeek weekday, Boolean leapYear = false) {
    value actual = date(year, month, day);
    assertEquals(year, actual.year);
    assertEquals(month, actual.month);
    assertEquals(day, actual.day);
    assertEquals(weekday, actual.weekday);
    assertEquals(leapYear, actual.leapYear);
}

/*
alias RataDie => Integer;
alias JulianDay => Float;
alias ModifiedJulianDay => Integer;
alias Year => Integer;
alias Week => Integer;
alias Day => Integer;
alias GregorianDate => [Year, Month, Day];
alias ISODate => [Year, Week, Day];
alias JulianDate => [Year, Month, Day];

alias TestData => {[RataDie, DayOfWeek, JulianDay, ModifiedJulianDay, Year, Month, Day, Year, Week, Day, Year, Month, Day]+};
TestData testData = { 
    [-214193, sunday, 1507231.5, -892769, -586, july, 24, -586, 29, 7, -587, july, 30],
    [-61378, wednesday, 1660037.5, -739963, -168, december, 5, -168, 49, 3, -169, december, 8]
};
*/