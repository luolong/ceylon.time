import ceylon.time { DateTime, dateTime, Period }
import ceylon.time.base { december, january, november, september }
import com.redhat.ceylon.sdk.test { assertEquals }

DateTime date_19821213T09080700_50 = dateTime {
    year = 1982;  
    month = december; 
    date = 13; 
    hour = 9; 
    minutes = 8;
    seconds = 7;
    millis = 50;
};

shared void testDateTime() {
    print("Testing instance");
    assertEquals( 1982, date_19821213T09080700_50.year);
    assertEquals( december, date_19821213T09080700_50.month);
    assertEquals( 13, date_19821213T09080700_50.day);
    assertEquals( 9, date_19821213T09080700_50.hours);
    assertEquals( 8, date_19821213T09080700_50.minutes);
    assertEquals( 7, date_19821213T09080700_50.seconds);
    assertEquals( 50, date_19821213T09080700_50.millis);
    
    print("Testing equals");
    assertEquals(date_19821213T09080700_50, dateTime(1982, december, 13, 9, 8, 7, 50));
    assertEquals(date_19821213T09080700_50.plusYears(1), dateTime(1983, december, 13, 9, 8, 7, 50));
    
    print("Testing plusYears");
    assertEquals( 2000, date_19821213T09080700_50.plusYears(18).year);
    
    print("Testing minusYears");
    assertEquals( 1964, date_19821213T09080700_50.minusYears(18).year);
    
    print("Testing plusMonths");
    assertEquals( january, date_19821213T09080700_50.plusMonths(1).month);
    
    print("Testing minusMonths");
    assertEquals( november, date_19821213T09080700_50.minusMonths(1).month);
    
    print("Testing plusDays");
    assertEquals( 15, date_19821213T09080700_50.plusDays(2).day);
    
    print("Testing minusDays");
    assertEquals( 9, date_19821213T09080700_50.minusDays(4).day);
    
    print("Testing plusHours");
    assertEquals( 18, date_19821213T09080700_50.plusHours(9).hours);
    
    value date_19821214T13 = date_19821213T09080700_50.plusHours(28); 
    assertEquals( 13, date_19821214T13.hours);
    assertEquals( 14, date_19821214T13.day);
    
    print("Testing minusHours");
    assertEquals( 2, date_19821213T09080700_50.minusHours(7).hours);
    
    value date_19821212T05 = date_19821213T09080700_50.minusHours(28);
    assertEquals( 5, date_19821212T05.hours);
    assertEquals( 12, date_19821212T05.day);
    
    print("Testing plusMinutes");
    assertEquals( 15, date_19821213T09080700_50.plusMinutes(7).minutes);
    
    value date_19821213T1003 = date_19821213T09080700_50.plusMinutes(55);
    assertEquals( 3, date_19821213T1003.minutes);
    assertEquals( 10, date_19821213T1003.hours);
    
    print("Testing minusMinutes");
    assertEquals( 15, date_19821213T09080700_50.plusMinutes(7).minutes);
    
    value date_19821213T0815 = date_19821213T09080700_50.minusMinutes(53);
    assertEquals( 15, date_19821213T0815.minutes);
    assertEquals( 8, date_19821213T0815.hours);    
    
    print("Testing plusSeconds");
    assertEquals( 16, date_19821213T09080700_50.plusSeconds(9).seconds);
    
    value date_19821213T090915 = date_19821213T09080700_50.plusSeconds(53+15);
    assertEquals( 15, date_19821213T090915.seconds);
    assertEquals( 9, date_19821213T090915.minutes);
    
    print("Testing minusSeconds");
    assertEquals( 15, date_19821213T09080700_50.plusMinutes(7).minutes);
    
    value date_19821213T090704 = date_19821213T09080700_50.minusSeconds(7+56);
    assertEquals( 4, date_19821213T090704.seconds);
    assertEquals( 7, date_19821213T090704.minutes);
    
    print("Testing plusMilliseconds");
    assertEquals( 150, date_19821213T09080700_50.plusMilliseconds(100).millis);
    
    value date_19821213T090815_300 = date_19821213T09080700_50.plusMilliseconds(950+7300);
    assertEquals( 300, date_19821213T090815_300.millis);
    assertEquals( 15, date_19821213T090815_300.seconds);
    
    print("Testing minusMilliseconds");
    assertEquals( 950, date_19821213T09080700_50.minusMilliseconds(100).millis);
    
    value date_19821213T090804_100 = date_19821213T09080700_50.minusMilliseconds(50+2900);
    assertEquals( 100, date_19821213T090804_100.millis);
    assertEquals( 4, date_19821213T090804_100.seconds);

    print("Testing plus");
    value period = Period { 
        years = 1; 
        months = 20; 
        days = 30; 
        hours = 40; 
        minutes = 50; 
        seconds = 60; 
        milliseconds = 700; 
    };

    value date_plus_period = date_19821213T090804_100.plus(period);
    assertEquals( 1985, date_plus_period.year);
    assertEquals( september, date_plus_period.month);
    assertEquals( 14, date_plus_period.day);
    assertEquals( 1, date_plus_period.hours);
    assertEquals( 59, date_plus_period.minutes);
    assertEquals( 4, date_plus_period.seconds);
    assertEquals( 800, date_plus_period.millis);

}