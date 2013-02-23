import ceylon.test { assertEquals }
import ceylon.time { time, Time }
import ceylon.time.base { seconds, minutes }

Time midnight = time();

Time time_14h_20m_07s_59ms = time {
    hours = 14;
    minutes = 20;
    seconds = 07;
    millis = 59;
};

shared void testHours() {
    for ( Integer h in 1..23 ) {
        assertTime {
            hour = h;
            secondsOfDay = h * seconds.perHour;
            minutesOfDay = h * minutes.perHour;
        };
    }
}

shared void testMinutes() {
    for ( Integer m in 1..59 ) {
        assertTime {
            minute = m;
            secondsOfDay = m * seconds.perMinute;
            minutesOfDay = m;
        };
    }
}

shared void testSeconds() {
    for ( Integer s in 1..59 ) {
        assertTime {
            second = s;
            secondsOfDay = s;
            minutesOfDay = 0;
        };
    }
}

shared void testMilliseconds() {
    for ( Integer ms in 1..999 ) {
        assertTime {
            milli = ms;
        };
    }
}

shared void test_09_08_59_0100() => assertTime(9,8,59,100, 32939, 548);
shared void test_00_00_0_0000() => assertTime(0,0,0,0, 0, 0);
shared void test_23_59_59_999() => assertTime(23,59,59,999, 86399, 1439);

shared void testPlusHours() {
    assertEquals( midnight.plusHours(15), time( 15 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(20), time( 10, 20, 7, 59 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(13), time( 3, 20, 7, 59 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(7), time( 21, 20, 7, 59 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(2), time( 16, 20, 7, 59 ) );

    value toTime_13 = time(09, 08, 07, 50).plusHours(28); 
    assertEquals( 13, toTime_13.hours);
}

shared void testMinusHours() {
    assertEquals( midnight.minusHours(15), time( 9 ) );
    assertEquals( time_14h_20m_07s_59ms.minusHours(20), time( 18, 20, 7, 59 ) );

    assertEquals( time( 9, 0, 0, 0 ).minusHours(28), time( 5, 0, 0, 0 ) );

    value time_5 = time(09, 08, 07, 0050).minusHours(28); 
    assertEquals( 5, time_5.hours);
}

shared void testPlusMinutes() {
    assertEquals( midnight.plusMinutes(15), time( 0, 15, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.plusMinutes(40), time( 15, 0, 7, 59 ) );
}

shared void testMinusMinutes() {
    assertEquals( midnight.minusMinutes(15), time( 23, 45, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.minusMinutes(21), time( 13, 59, 7, 59 ) );
}

shared void testPlusSeconds() {
    assertEquals( midnight.plusSeconds(15), time( 0, 0, 15, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.plusSeconds(54), time( 14, 21, 1, 59 ) );
}

shared void testMinusSeconds() {
    assertEquals( midnight.minusSeconds(15), time( 23, 59, 45, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.minusSeconds(21), time( 14, 19, 46, 59 ) );
}

shared void testPlusMilliseconds() {
    assertEquals( midnight.plusMilliseconds( 20 ), time( 0, 0, 0, 20 ) );
    assertEquals( time_14h_20m_07s_59ms.plusMilliseconds( 941 ), time( 14, 20, 8, 0 ) );
}

shared void testMinusMilliseconds() {
    assertEquals( midnight.minusMilliseconds( 20 ), time( 23, 59, 59, 980 ) );
    assertEquals( time_14h_20m_07s_59ms.minusMilliseconds( 941 ), time( 14, 20, 6, 118 ) );
}

shared void testWithHours() {
    assertEquals( midnight.withHours( 20 ), time( 20, 0, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.withHours( 2 ), time( 2, 20, 7, 59 ) );
}

shared void testWithMinutes() {
    assertEquals( midnight.withMinutes( 20 ), time( 0, 20, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.withMinutes( 2 ), time( 14, 2, 7, 59 ) );
}

shared void testWithSeconds() {
    assertEquals( midnight.withSeconds( 20 ), time( 0, 0, 20, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.withSeconds( 2 ), time( 14, 20, 2, 59 ) );
}

shared void testWithMilliseconds() {
    assertEquals( midnight.withMilliseconds( 20 ), time( 0, 0, 0, 20 ) );
    assertEquals( time_14h_20m_07s_59ms.withMilliseconds( 2 ), time( 14, 20, 7, 2 ) );
}

shared void testPredecessor_Time() {
    assertEquals( midnight.predecessor, time(23,59,59) ); 
}

shared void testSuccessor_Time() {
    assertEquals( midnight.successor, time(0,0,1) ); 
}

shared void testString_Time() {
    assertEquals( midnight.string, "00:00:00.0000");
    assertEquals( time_14h_20m_07s_59ms.string, "14:20:07.0059");
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