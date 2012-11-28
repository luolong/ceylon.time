import ceylon.time.base { monday, tuesday, wednesday, thursday, friday, saturday, sunday }
import com.redhat.ceylon.sdk.test { assertTrue }

void testDayOfWeek(){

    print("Testing successors");
    assertTrue( monday.successor === tuesday, "monday.successor === tuesday" );
    assertTrue( tuesday.successor === wednesday, "tuesday.successor === wednesday" );
    assertTrue( wednesday.successor === thursday, "wednesday.successor === thursday" );
    assertTrue( thursday.successor === friday, "thursday.successor === friday" );
    assertTrue( friday.successor === saturday, "friday.successor === saturday" );
    assertTrue( saturday.successor === sunday, "saturday.successor === sunday" );
    assertTrue( sunday.successor === monday, "sunday.successor === monday" );

    print("Testing predecessors");
    assertTrue( sunday.predecessor === saturday, "sunday.predecessor === saturday" );
    assertTrue( saturday.predecessor === friday, "saturday.predecessor === friday" );
    assertTrue( friday.predecessor === thursday, "friday.predecessor === thursday" );
    assertTrue( thursday.predecessor === wednesday, "thursday.predecessor === wednesday" );
    assertTrue( wednesday.predecessor === tuesday, "wednesday.predecessor === tuesday" );
    assertTrue( tuesday.predecessor === monday, "tuesday.predecessor === monday" );
    assertTrue( monday.predecessor === sunday, "monday.predecessor === sunday" );

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