import ceylon.time { Date }
shared abstract class AbstractDate( dayOfEra )
	satisfies Date {

	shared actual Integer dayOfEra;
	
	shared actual Comparison compare(Date other) {
		return dayOfEra <=> other.dayOfEra;
	}
	
	shared actual Integer distanceFrom(Date other) {
		return dayOfEra.distanceFrom(other.dayOfEra);
	}
}