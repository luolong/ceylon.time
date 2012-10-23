import ceylon.time { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void testDayOfWeek(){
	
	print("Testing successors");
	check( monday.successor === tuesday );
	check( tuesday.successor === wednesday );
	check( wednesday.successor === thursday );
	check( thursday.successor === friday );
	check( friday.successor === saturday );
	check( saturday.successor === sunday );
	check( sunday.successor === monday );
	
	print("Testing predecessors");
	check( sunday.predecessor === saturday );
	check( saturday.predecessor === friday );
	check( friday.predecessor === thursday );
	check( thursday.predecessor === wednesday );
	check( wednesday.predecessor === tuesday );
	check( tuesday.predecessor === monday );
	check( monday.predecessor === sunday );
	
	print("Comparing days of week: monday");
	check( monday < tuesday );
	check( monday < wednesday );
	check( monday < thursday );
	check( monday < friday );
	check( monday < saturday );
	check( monday > sunday );
	
	print("Comparing days of week: tuesday");
	check( tuesday > monday );
	check( tuesday < wednesday );
	check( tuesday < thursday );
	check( tuesday < friday );
	check( tuesday < saturday );
	check( tuesday > sunday );
	
	print("Comparing days of week: wednesday");
	check( wednesday > monday );
	check( wednesday > tuesday );
	check( wednesday < thursday );
	check( wednesday < friday );
	check( wednesday < saturday );
	check( wednesday > sunday );
	
	print("Comparing days of week: thursday");
	check( thursday > monday );
	check( thursday > tuesday );
	check( thursday > wednesday );
	check( thursday < friday );
	check( thursday < saturday );
	check( thursday > sunday );
	
	print("Comparing days of week: friday");
	check( friday > monday );
	check( friday > tuesday );
	check( friday > wednesday );
	check( friday > thursday );
	check( friday < saturday );
	check( friday > sunday );
	
}