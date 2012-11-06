import com.redhat.ceylon.sdk.test { assertTrue }
import ceylon.time { date, Date }
import ceylon.time.base { december, monday, january }

Date data_1982_12_13 = date( 1982, december, 13);

shared void testDates() {

	print("Testing GregorianCalendar Instances");
	assertTrue( data_1982_12_13.dayOfYear == 347 );
	assertTrue( data_1982_12_13.dayOfMonth == 13 );
	assertTrue( data_1982_12_13.dayOfEra == 724197 );
	assertTrue( data_1982_12_13.dayOfWeek == monday );

	print( "Testing plusDays");
	assertTrue( data_1982_12_13.plusDays( 5 )  <=> date( 1982, december, 18 ) == equal );
	assertTrue( data_1982_12_13.plusDays( 5 )  <=> date( 1982, december, 18 ) == equal );
	assertTrue( data_1982_12_13.plusDays( 45 ) <=> date( 1983, january, 27 )  == equal );

	print( "Testing minusDays");
	assertTrue( data_1982_12_13.minusDays( 5 ) <=> date( 1982, december, 8 ) == equal );

	print( "Testing plusMonths");
	assertTrue( data_1982_12_13.plusMonths(1) <=> date( 1983, january, 12) == equal );

	print( "Testing withDays");
	assertTrue( data_1982_12_13.withDays(17) <=> date( 1982, december, 17) == equal);

 	//TODO: Waiting fix from ceylon language
 	//for ( DayOfWeek day in  monday..sunday ) {
 	//	
 	//}
 
}
