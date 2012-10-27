import com.redhat.ceylon.sdk.test { assertTrue }
import ceylon.time { Period, years, months }

Period oneYear = Period {
	years = 1;
};

Period oneHalfYear = Period {
	years = 1;
	months = 6;
};

Period twelveMonths = Period {
	months = 12;
};

Period oneYear2Months3Days4Hours5Minutes6Seconds7Milliseconds = Period {
	years = 1;
	months = 2;
	days = 3;
	hours = 4;
	minutes = 5;
	seconds = 6;
	milliseconds = 7;
};

shared void testPeriods() {

	print( "Testing equals" );
	assertTrue( oneYear == twelveMonths.normalized(), "oneYear == twelveMonths.normalized()" );
	assertTrue( oneYear == years( 1 ), "oneYear == years( 1 )" ); 
	
	print( "Testing plus" );
	assertTrue( oneYear.plusYears( 2 ) == years( 3 ), "oneYear.plusYears( 2 ) == years( 3 )" );
	
	print( "Testing minus" );
	assertTrue( twelveMonths.minusMonths( 1 ) == months( 11 ), "twelveMonths.minusMonths( 1 ) == months( 11 )" );

	print( "Testing Comparable" );
	assertTrue( ( oneYear <=> twelveMonths ) == equal, "( oneYear <=> twelveMonths ) == equal" );
	assertTrue( oneYear < oneHalfYear, "oneYear < oneHalfYear" );
	assertTrue( oneHalfYear > twelveMonths, "oneHalfYear > twelveMonths" );
	
	print( "Testing string as ISO 8061" );
	assertTrue( "P1Y" == oneYear.string, "Not implemented: " oneYear.string "" );
	assertTrue( "" == oneYear2Months3Days4Hours5Minutes6Seconds7Milliseconds.string, "Not implemented: " oneYear2Months3Days4Hours5Minutes6Seconds7Milliseconds.string "" );

}