import ceylon.time { monday, tuesday, wednesday, thursday, friday, saturday, sunday, weekdays, DayOfWeek }
import com.redhat.ceylon.sdk.test { assertTrue, assertEquals, fail, Suite }


class WeekdaysSuite() extends Suite("Weekdays"){
    shared actual Iterable<String->Void()> suite = {
        "Weekdays" -> testDayOfWeekSuccessor,
        "Predecessors" -> testDayOfWeekPredecessor,
        "Iteration: sunday..saturday" -> testIterateMondayToSunday,
        "Iteration: monday..sunday" -> testIterateMondayToSunday
    };
}
 
void testDayOfWeek(){
	
	WeekdaysSuite().run();
	
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

void testDayOfWeekSuccessor(){
	assertEquals( monday, sunday.successor );
	assertEquals( tuesday,  monday.successor );
	assertEquals( wednesday, tuesday.successor );
	assertEquals( thursday, wednesday.successor );
	assertEquals( friday, thursday.successor );
	assertEquals( saturday, friday.successor );
	assertEquals( sunday, saturday.successor );	
}

void testDayOfWeekPredecessor(){
	assertEquals( saturday, sunday.predecessor );
	assertEquals( friday, saturday.predecessor );
	assertEquals( thursday, friday.predecessor );
	assertEquals( wednesday, thursday.predecessor );
	assertEquals( tuesday, wednesday.predecessor );
	assertEquals( monday, tuesday.predecessor );
	assertEquals( sunday, monday.predecessor );
}

void testIterateMondayToSunday(){
	fail("Ceylon compiler can not handle covariant ranges.");
	
	variable StringBuilder sb := StringBuilder().append("|");
	for (DayOfWeek wd in weekdays.from(monday).to(sunday)){
	}
	value actual = sb.string;
	value expected = "|monday|tuesday|wednesday|thursday|friday|saturday|sunday|";
	assertEquals(expected, actual, "Should be able to iterate over from monday to sunday.");
}
void testIterateSundayToSaturday(){
	fail("Ceylon compiler can not handle covariant ranges.");
	//value expected = "|monday|tuesday|wednesday|thursday|friday|saturday|sunday|";
	//variable StringBuilder sb := StringBuilder().append("|");
	//for (DayOfWeek dow in monday .. sunday){
	//	sb := sb.append(dow.string).append("|");
	//}
	//value actual = sb.string;
	//assertEquals(expected, actual, "Should be able to iterate over from monday to sunday.");
}