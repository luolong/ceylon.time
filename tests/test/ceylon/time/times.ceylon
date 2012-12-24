import com.redhat.ceylon.sdk.test { assertEquals }
import ceylon.time { time, Time }

Time midnight = time();

Time time_14h_20m_07s_59ms = time {
    hours = 14;
    minutes = 20;
    seconds = 07;
    millis = 59;
};

shared void testTimes() {

    print( "Testing instance" );
    assertEquals( midnight.millis, 0, "millis" );
    assertEquals( midnight.secondsOfDay, 0, "secondsOfDay" );
    assertEquals( midnight.seconds, 0, "seconds" );
    assertEquals( midnight.minutesOfDay, 0, "minutesOfDay" );
    assertEquals( midnight.minutes, 0, "minutes" );
    assertEquals( midnight.hours, 0, "hour" );

    assertEquals( time_14h_20m_07s_59ms.millis, 59, "millis" );
    assertEquals( time_14h_20m_07s_59ms.secondsOfDay, 51607, "secondsOfDay" );
    assertEquals( time_14h_20m_07s_59ms.seconds, 7, "seconds" );
    assertEquals( time_14h_20m_07s_59ms.minutesOfDay, 860, "minutesOfDay" );
    assertEquals( time_14h_20m_07s_59ms.minutes, 20, "minutes" );
    assertEquals( time_14h_20m_07s_59ms.hours, 14, "hour" );

    print( "Testing plusHours");
    assertEquals( midnight.plusHours(15), time( 15 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(20), time( 10, 20, 7, 59 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(13), time( 3, 20, 7, 59 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(7), time( 21, 20, 7, 59 ) );
    assertEquals( time_14h_20m_07s_59ms.plusHours(2), time( 16, 20, 7, 59 ) );

    value toTime_13 = time(09, 08, 07, 50).plusHours(28); 
    assertEquals( 13, toTime_13.hours);

    print( "Testing minusHours");
    assertEquals( midnight.minusHours(15), time( 9 ) );
    assertEquals( time_14h_20m_07s_59ms.minusHours(20), time( 18, 20, 7, 59 ) );

    assertEquals( time( 9, 0, 0, 0 ).minusHours(28), time( 5, 0, 0, 0 ) );

    value time_5 = time(09, 08, 07, 0050).minusHours(28); 
    assertEquals( 5, time_5.hours);

    print( "Testing plusMinutes");
    assertEquals( midnight.plusMinutes(15), time( 0, 15, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.plusMinutes(40), time( 15, 0, 7, 59 ) );

    print( "Testing minusMinutes");
    assertEquals( midnight.minusMinutes(15), time( 23, 45, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.minusMinutes(21), time( 13, 59, 7, 59 ) );

    print( "Testing plusSeconds");
    assertEquals( midnight.plusSeconds(15), time( 0, 0, 15, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.plusSeconds(54), time( 14, 21, 1, 59 ) );

    print( "Testing minusSeconds");
    assertEquals( midnight.minusSeconds(15), time( 23, 59, 45, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.minusSeconds(21), time( 14, 19, 46, 59 ) );

    print( "Testing plusMilliseconds");
    assertEquals( midnight.plusMilliseconds( 20 ), time( 0, 0, 0, 20 ) );
    assertEquals( time_14h_20m_07s_59ms.plusMilliseconds( 941 ), time( 14, 20, 8, 0 ) );

    print( "Testing minusMilliseconds");
    assertEquals( midnight.minusMilliseconds( 20 ), time( 23, 59, 59, 980 ) );
    assertEquals( time_14h_20m_07s_59ms.minusMilliseconds( 941 ), time( 14, 20, 6, 118 ) );

    print( "Testing withHours");
    assertEquals( midnight.withHours( 20 ), time( 20, 0, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.withHours( 2 ), time( 2, 20, 7, 59 ) );

    print( "Testing withMinutes");
    assertEquals( midnight.withMinutes( 20 ), time( 0, 20, 0, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.withMinutes( 2 ), time( 14, 2, 7, 59 ) );

    print( "Testing withSeconds");
    assertEquals( midnight.withSeconds( 20 ), time( 0, 0, 20, 0 ) );
    assertEquals( time_14h_20m_07s_59ms.withSeconds( 2 ), time( 14, 20, 2, 59 ) );

    print( "Testing withMilliseconds");
    assertEquals( midnight.withMilliseconds( 20 ), time( 0, 0, 0, 20 ) );
    assertEquals( time_14h_20m_07s_59ms.withMilliseconds( 2 ), time( 14, 20, 7, 2 ) );
}