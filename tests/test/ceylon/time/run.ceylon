
doc "Run the tests of module `ceylon.time`."
void run() {
	
	print("
=================================
 Testing Ceylon Date/Time library
=================================");
	
	testDayOfWeek();
	
	
	print("
=================================");
	
	results();
}