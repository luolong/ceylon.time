import ceylon.time { DateTime, dateTime }
import ceylon.time.base { december, january, november }
import com.redhat.ceylon.sdk.test { assertEquals }

DateTime data_1982_12_13_09_08_07_0050 = dateTime { year = 1982;  
                                                    month = december; 
                                                    date = 13; 
                                                    hour = 9; 
                                                    minutes = 8;
                                                    seconds = 7;
                                                    millis = 50;
                                                  };

shared void testDateTime() {
    
    print("Testing instance");
    assertEquals( 1982, data_1982_12_13_09_08_07_0050.year);
    assertEquals( december, data_1982_12_13_09_08_07_0050.month);
    assertEquals( 13, data_1982_12_13_09_08_07_0050.day);
    assertEquals( 9, data_1982_12_13_09_08_07_0050.hours);
    assertEquals( 8, data_1982_12_13_09_08_07_0050.minutes);
    assertEquals( 7, data_1982_12_13_09_08_07_0050.seconds);
    assertEquals( 50, data_1982_12_13_09_08_07_0050.millis);
    
    print("Testing equals");
    assertEquals(data_1982_12_13_09_08_07_0050, dateTime(1982, december, 13, 9, 8, 7, 50));
    assertEquals(data_1982_12_13_09_08_07_0050.plusYears(1), dateTime(1983, december, 13, 9, 8, 7, 50));
    
    print("Testing plusYears");
    assertEquals( 2000, data_1982_12_13_09_08_07_0050.plusYears(18).year);
    
    print("Testing minusYears");
    assertEquals( 1964, data_1982_12_13_09_08_07_0050.minusYears(18).year);
    
    print("Testing plusMonths");
    assertEquals( january, data_1982_12_13_09_08_07_0050.plusMonths(1).month);
    
    print("Testing minusMonths");
    assertEquals( november, data_1982_12_13_09_08_07_0050.minusMonths(1).month);
    
    print("Testing plusDays");
    assertEquals( 15, data_1982_12_13_09_08_07_0050.plusDays(2).day);
    
    print("Testing minusDays");
    assertEquals( 9, data_1982_12_13_09_08_07_0050.minusDays(4).day);
    
    print("Testing plusHours");
    assertEquals( 18, data_1982_12_13_09_08_07_0050.plusHours(9).hours);
    
    value data_1982_12_14_13 = data_1982_12_13_09_08_07_0050.plusHours(28); 
    assertEquals( 13, data_1982_12_14_13.hours);
    assertEquals( 14, data_1982_12_14_13.day);
    
    print("Testing minusHours");
    assertEquals( 2, data_1982_12_13_09_08_07_0050.minusHours(7).hours);
    
    value data_1982_12_12_5 = data_1982_12_13_09_08_07_0050.minusHours(28);
    assertEquals( 5, data_1982_12_12_5.hours);
    assertEquals( 12, data_1982_12_12_5.day);
    
    print("Testing plusMinutes");
    assertEquals( 15, data_1982_12_13_09_08_07_0050.plusMinutes(7).minutes);
    
    value data_1982_12_13_10_3 = data_1982_12_13_09_08_07_0050.plusMinutes(55);
    assertEquals( 3, data_1982_12_13_10_3.minutes);
    assertEquals( 10, data_1982_12_13_10_3.hours);
    
    print("Testing minusMinutes");
    assertEquals( 15, data_1982_12_13_09_08_07_0050.plusMinutes(7).minutes);
    
    value data_1982_12_13_8_15 = data_1982_12_13_09_08_07_0050.minusMinutes(53);
    assertEquals( 15, data_1982_12_13_8_15.minutes);
    assertEquals( 8, data_1982_12_13_8_15.hours);    
    
    print("Testing plusSeconds");
    assertEquals( 16, data_1982_12_13_09_08_07_0050.plusSeconds(9).seconds);
    
    value data_1982_12_13_9_9_15 = data_1982_12_13_09_08_07_0050.plusSeconds(53+15);
    assertEquals( 15, data_1982_12_13_9_9_15.seconds);
    assertEquals( 9, data_1982_12_13_9_9_15.minutes);
    
    print("Testing minusSeconds");
    assertEquals( 15, data_1982_12_13_09_08_07_0050.plusMinutes(7).minutes);
    
    value data_1982_12_13_9_7_4 = data_1982_12_13_09_08_07_0050.minusSeconds(7+56);
    assertEquals( 4, data_1982_12_13_9_7_4.seconds);
    assertEquals( 7, data_1982_12_13_9_7_4.minutes);
    
    print("Testing plusMilliseconds");
    assertEquals( 150, data_1982_12_13_09_08_07_0050.plusMilliseconds(100).millis);
    
    value data_1982_12_13_9_8_15_300 = data_1982_12_13_09_08_07_0050.plusMilliseconds(950+7300);
    assertEquals( 300, data_1982_12_13_9_8_15_300.millis);
    assertEquals( 15, data_1982_12_13_9_8_15_300.seconds);
    
    print("Testing minusMilliseconds");
    assertEquals( 950, data_1982_12_13_09_08_07_0050.minusMilliseconds(100).millis);
    
    value data_1982_12_13_9_8_4_100 = data_1982_12_13_09_08_07_0050.minusMilliseconds(50+2900);
    assertEquals( 100, data_1982_12_13_9_8_4_100.millis);
    assertEquals( 4, data_1982_12_13_9_8_4_100.seconds);

}