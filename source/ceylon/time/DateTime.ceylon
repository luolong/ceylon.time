import ceylon.time { createDate = date }

doc "Interface representing a time of day within a date (like _4pm, October 21. 2012_) 
	 without a reference to a time zone.
	
	This means that Date time instances for _4pm, October 21. 2012_ are all always equal
	een if created in different timezones. 
	
    "
shared interface DateTime 
	satisfies ReadableDate & ReadableTime & Ordinal<DateTime> & Comparable<DateTime> {

} 

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
 
}

doc "Returns a date based on the specified year, month and day-ofMonth values"
shared DateTime dateTime(Integer year, Integer|MonthOfYear month, Integer date, Integer hour, Integer minutes=0, Integer seconds=0, Integer millis=0){
	return DateTimeImpl( createDate( year, month, date), time( hour, minutes, seconds, millis ));
}