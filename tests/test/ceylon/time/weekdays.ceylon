import ceylon.time { date, Date }
import ceylon.time.base { monday, tuesday, wednesday, thursday, friday, saturday, sunday, january, december }

import ceylon.test { assertTrue, assertEquals, assertSame }

void testDayOfWeek(){

    print("Testing successors");
    assertSame( tuesday, monday.successor );
    assertSame( wednesday, tuesday.successor );
    assertSame( thursday, wednesday.successor );
    assertSame( friday, thursday.successor );
    assertSame( saturday, friday.successor );
    assertSame( sunday, saturday.successor );
    assertSame( monday, sunday.successor );

    print("Testing predecessors");
    assertSame( saturday, sunday.predecessor );
    assertSame( friday, saturday.predecessor );
    assertSame( thursday, friday.predecessor );
    assertSame( wednesday, thursday.predecessor );
    assertSame( tuesday, wednesday.predecessor );
    assertSame( monday, tuesday.predecessor );
    assertSame( sunday, monday.predecessor );

    print("Comparing days of week: monday");
    assertTrue( monday < tuesday, "monday < tuesday" );
    assertTrue( monday < wednesday, "monday < wednesday" );
    assertTrue( monday < thursday, "monday < thursday" );
    assertTrue( monday < friday, "monday < friday" );
    assertTrue( monday < saturday, "monday < saturday" );
    assertTrue( monday > sunday, "monday > sunday" );

    print("Comparing days of week: tuesday");
    assertTrue( tuesday > monday, "tuesday > monday" );
    assertTrue( tuesday < wednesday, "tuesday < wednesday" );
    assertTrue( tuesday < thursday, "tuesday < thursday" );
    assertTrue( tuesday < friday, "tuesday < friday" );
    assertTrue( tuesday < saturday, "tuesday < saturday" );
    assertTrue( tuesday > sunday, "tuesday > sunday" );

    print("Comparing days of week: wednesday");
    assertTrue( wednesday > monday, "wednesday > monday" );
    assertTrue( wednesday > tuesday, "wednesday > tuesday" );
    assertTrue( wednesday < thursday, "wednesday < thursday" );
    assertTrue( wednesday < friday, "wednesday < friday" );
    assertTrue( wednesday < saturday, "wednesday < saturday" );
    assertTrue( wednesday > sunday, "wednesday > sunday" );

    print("Comparing days of week: thursday");
    assertTrue( thursday > monday, "thursday > monday" );
    assertTrue( thursday > tuesday, "thursday > tuesday" );
    assertTrue( thursday > wednesday, "thursday > wednesday" );
    assertTrue( thursday < friday, "thursday < friday" );
    assertTrue( thursday < saturday, "thursday < saturday" );
    assertTrue( thursday > sunday, "thursday > sunday" );

    print("Comparing days of week: friday");
    assertTrue( friday > monday, "friday > monday" );
    assertTrue( friday > tuesday, "friday > tuesday" );
    assertTrue( friday > wednesday, "friday > wednesday" );
    assertTrue( friday > thursday, "friday > thursday" );
    assertTrue( friday < saturday, "friday < saturday" );
    assertTrue( friday > sunday, "friday > sunday" );

    print( "Testing Ordinal");
    value data_1982_12_13 = date( 1982, december, 13);
    value data_1983_01_01 = date( 1983, january, 1 );
    variable value weekday := data_1982_12_13.weekday; 
    for ( Date date in data_1982_12_13..data_1983_01_01 ) {
        assertEquals( date.weekday, weekday++ );
    }

    print("Testing distanceFrom");
    assertEquals( 0, sunday.distanceFrom(sunday));
    assertEquals( 1, sunday.distanceFrom(monday));
    assertEquals( 2, sunday.distanceFrom(tuesday));
    assertEquals( 3, sunday.distanceFrom(wednesday));
    assertEquals( 4, sunday.distanceFrom(thursday));
    assertEquals( 5, sunday.distanceFrom(friday));
    assertEquals( 6, sunday.distanceFrom(saturday));

    assertEquals( 0, monday.distanceFrom(monday));
    assertEquals( 1, monday.distanceFrom(tuesday));
    assertEquals( 2, monday.distanceFrom(wednesday));
    assertEquals( 3, monday.distanceFrom(thursday));
    assertEquals( 4, monday.distanceFrom(friday));
    assertEquals( 5, monday.distanceFrom(saturday));
	assertEquals( 6, monday.distanceFrom(sunday));

    assertEquals( 0, tuesday.distanceFrom(tuesday));
    assertEquals( 1, tuesday.distanceFrom(wednesday));
    assertEquals( 2, tuesday.distanceFrom(thursday));
    assertEquals( 3, tuesday.distanceFrom(friday));
    assertEquals( 4, tuesday.distanceFrom(saturday));
    assertEquals( 5, tuesday.distanceFrom(sunday));
    assertEquals( 6, tuesday.distanceFrom(monday));

    assertEquals( 0, wednesday.distanceFrom(wednesday));
    assertEquals( 1, wednesday.distanceFrom(thursday));
    assertEquals( 2, wednesday.distanceFrom(friday));
    assertEquals( 3, wednesday.distanceFrom(saturday));
    assertEquals( 4, wednesday.distanceFrom(sunday));
    assertEquals( 5, wednesday.distanceFrom(monday));
    assertEquals( 6, wednesday.distanceFrom(tuesday));

    assertEquals( 0, thursday.distanceFrom(thursday));
    assertEquals( 1, thursday.distanceFrom(friday));
    assertEquals( 2, thursday.distanceFrom(saturday));
    assertEquals( 3, thursday.distanceFrom(sunday));
    assertEquals( 4, thursday.distanceFrom(monday));
    assertEquals( 5, thursday.distanceFrom(tuesday));
    assertEquals( 6, thursday.distanceFrom(wednesday));

    assertEquals( 0, friday.distanceFrom(friday));
    assertEquals( 1, friday.distanceFrom(saturday));
    assertEquals( 2, friday.distanceFrom(sunday));
    assertEquals( 3, friday.distanceFrom(monday));
    assertEquals( 4, friday.distanceFrom(tuesday));
    assertEquals( 5, friday.distanceFrom(wednesday));
    assertEquals( 6, friday.distanceFrom(thursday));

    assertEquals( 0, saturday.distanceFrom(saturday));
    assertEquals( 1, saturday.distanceFrom(sunday));
    assertEquals( 2, saturday.distanceFrom(monday));
    assertEquals( 3, saturday.distanceFrom(tuesday));
    assertEquals( 4, saturday.distanceFrom(wednesday));
    assertEquals( 5, saturday.distanceFrom(thursday));
    assertEquals( 6, saturday.distanceFrom(friday));	
}
