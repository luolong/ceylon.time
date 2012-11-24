import ceylon.time { createDate = date }
import ceylon.time.base { ReadableTime, ReadableDate, DayOfWeek, MonthOfYear, DateTimeBehavior }

doc "Interface representing a time of day within a date (like _4pm, October 21. 2012_) 
	 without a reference to a time zone.
	
	This means that Date time instances for _4pm, October 21. 2012_ are all always equal
	een if created in different timezones. 
	
    "
shared interface DateTime 
	satisfies ReadableDate 
			& ReadableTime
			& DateTimeBehavior<DateTime> 
			& Ordinal<DateTime> & Comparable<DateTime> {

} 

//TODO: Needs a better name... 
shared class DateTimeImpl( date, time ) satisfies DateTime {
	
	shared Date date;
	shared Time time;

	shared actual Comparison compare(DateTime other) {
		return bottom;
	}

	shared actual Integer dayOfMonth {
		return date.dayOfMonth;
	}

	shared actual DayOfWeek dayOfWeek {
		return date.dayOfWeek;
	}

	shared actual Integer dayOfYear {
		return date.dayOfYear;
	}
	
	shared actual Integer dayOfEra {
		return date.dayOfEra;
	}

	shared actual Integer year {
		return date.year;
	}

	shared actual Boolean leapYear {
		return date.leapYear;
	}
	
	shared actual Integer weekOfYear {
		return date.weekOfYear;
	}

	shared actual MonthOfYear month {
		return date.month;
	}

	shared actual Integer hours {
		return time.hours;
	}

	shared actual Integer millis {
		return time.millis;
	}
	
	shared actual Integer millisOfDay {
		return time.millisOfDay;
	}

	shared actual Integer minutes {
		return time.minutes;
	}

	shared actual Integer minutesOfDay {
		return time.minutesOfDay;
	}

	shared actual Integer seconds {
		return time.seconds;
	}

	shared actual Integer secondsOfDay {
		return time.secondsOfDay;
	}
	
	shared actual Integer distanceFrom(DateTime other) {
		return bottom;
	}
	
	shared actual DateTime predecessor = bottom;
	
	shared actual DateTime successor = bottom;
	shared actual DateTime minusDays(Integer days) {
		return bottom;
	}
	shared actual DateTime minusHours(Integer hours) {
		return bottom;
	}
	shared actual DateTime minusMilliseconds(Integer milliseconds) {
		return bottom;
	}
	shared actual DateTime minusMinutes(Integer minutes) {
		return bottom;
	}
	shared actual DateTime minusMonths(Integer months) {
		return bottom;
	}
	shared actual DateTime minusSeconds(Integer seconds) {
		return bottom;
	}
	shared actual DateTime minusYears(Integer years) {
		return bottom;
	}
	shared actual DateTime plusDays(Integer days) {
		return bottom;
	}
	shared actual DateTime plusHours(Integer hours) {
		return bottom;
	}
	shared actual DateTime plusMilliseconds(Integer milliseconds) {
		return bottom;
	}
	shared actual DateTime plusMinutes(Integer minutes) {
		return bottom;
	}
	shared actual DateTime plusMonths(Integer months) {
		return bottom;
	}
	shared actual DateTime plusSeconds(Integer seconds) {
		return bottom;
	}
	shared actual DateTime plusYears(Integer years) {
		return bottom;
	}
	shared actual DateTime toDateOnly() {
		return bottom;
	}
	shared actual DateTime toTimeOnly() {
		return bottom;
	}
	shared actual DateTime withDayOfMonth(Integer dayOfMonth) {
		return bottom;
	}
	shared actual DateTime withHours(Integer hours) {
		return bottom;
	}
	shared actual DateTime withMilliseconds(Integer milliseconds) {
		return bottom;
	}
	shared actual DateTime withMinutes(Integer minutes) {
		return bottom;
	}
	shared actual DateTime withMonth(Integer|MonthOfYear month) {
		return bottom;
	}
	shared actual DateTime withSeconds(Integer seconds) {
		return bottom;
	}
	shared actual DateTime withYear(Integer year) {
		return bottom;
	}
	shared actual DateTime plusWeeks(Integer weeks) {
		return bottom;
	}
 	shared actual DateTime minusWeeks(Integer weeks) {
		return bottom;
	}
}

doc "Returns a date based on the specified year, month and day-ofMonth values"
shared DateTime dateTime(Integer year, Integer|MonthOfYear month, Integer date, Integer hour, Integer minutes=0, Integer seconds=0, Integer millis=0){
	return DateTimeImpl( createDate( year, month, date), time( hour, minutes, seconds, millis ));
}