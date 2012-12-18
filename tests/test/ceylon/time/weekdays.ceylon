import ceylon.time.base { monday, tuesday, wednesday, thursday, friday, saturday, sunday }
import com.redhat.ceylon.sdk.test { assertTrue, assertSame }

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

}