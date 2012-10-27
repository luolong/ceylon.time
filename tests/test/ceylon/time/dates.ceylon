import com.redhat.ceylon.sdk.test { assertTrue }
import ceylon.time { date, Date }
import ceylon.time.base { december, monday }

Date data_1982_12_13 = date( 1982, december, 13);

shared void testDates() {

	print("Testing GregorianCalendar Instances");
	assertTrue( data_1982_12_13.dayOfYear == 347 );
	assertTrue( data_1982_12_13.dayOfMonth == 13 );
	assertTrue( data_1982_12_13.dayOfEra == 724197 );
	
	assertTrue( data_1982_12_13.dayOfWeek == monday );
 
}
