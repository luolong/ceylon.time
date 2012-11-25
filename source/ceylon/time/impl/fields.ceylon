doc "Should have all informations about each field"
shared abstract class Field(  ) 
				of milliPerSecond | milliPerMinute | milliPerHour | milliPerDay | secondPerMinute | secondPerHour |secondPerDay | minutePerHour | minutePerDay | hourPerAmPm | hourPerDay | amPmPerDay 
								 | dayPerWeek | dayPerMonth | dayPerYear | epochPerDay | weekPerMonth | weekPerYear | monthPerYear | epochPerMonth | yearPerEra | year | era 
				satisfies DateTimeField {

	doc "
	     Checks that the specified value is valid for this field.
	     
	     This validates that the value is within the outer range of valid values
	     returned by {@link #range()}.
	      
	     @param value  the value to check
	     @return the value that was passed in
	     
	"
    shared Integer checkValidValue(Integer valor) {
        return range().checkValidValue(valor, this);
    }

}

doc 
"
	The milli-of-second.
	This counts the millisecond within the second, from 0 to 999.
	This field has the same meaning for all calendar systems.
"
shared object milliPerSecond extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 999;
			maximumLargest = 999;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 1000;
	}

}

shared object milliPerMinute extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 60000 -1;
			maximumLargest = 60000 -1;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 60000;
	}

}

shared object milliPerHour extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 3600000 -1;
			maximumLargest = 3600000 -1;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 3600000;
	}

}

doc
"
	The milli-of-day.
	This counts the millisecond within the day, from 0 to (24 * 60 * 60 * 1,000) - 1.
	This field has the same meaning for all calendar systems.
"
shared object milliPerDay extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 86400 * 1000 - 1;
			maximumLargest = 86400 * 1000 - 1;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 86400 * 1000;
	}

}

doc
"
	The second-of-minute.
	This counts the second within the minute, from 0 to 59.
	This field has the same meaning for all calendar systems.
"
shared object secondPerMinute extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 59;
			maximumLargest = 59;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 60;
	}

}

shared object secondPerHour extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 3599;
			maximumLargest = 3599;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 3600;
	}

}

doc
"
	The second-of-day.
	This counts the second within the day, from 0 to (24 * 60 * 60) - 1.
	This field has the same meaning for all calendar systems.
"
shared object secondPerDay extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 86400 - 1;
			maximumLargest = 86400 - 1;
		};
	}
	
	shared Integer getMaximumRepresentation() {
		return 86400;
	}

}

doc
"
	The minute-of-hour.
	This counts the minute within the hour, from 0 to 59.
	This field has the same meaning for all calendar systems.
"
shared object minutePerHour extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 59;
			maximumLargest = 59;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 60;
	}

}

doc 
"
	The minute-of-day.
	This counts the minute within the day, from 0 to (24 * 60) - 1.
	This field has the same meaning for all calendar systems.
"
shared object minutePerDay extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = (24 * 60) - 1;
			maximumLargest = (24 * 60) - 1;
		};
	}

	shared Integer getMaximumRepresentation() {
		return (24 * 60);
	}

}

doc
"
	The hour-of-am-pm.
	This counts the hour within the AM/PM, from 0 to 11.
	This field has the same meaning for all calendar systems.
"
shared object hourPerAmPm extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 11;
			maximumLargest = 11;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 12;
	}

}

doc
"
	The hour-of-day.
	This counts the hour within the day, from 0 to 23.
	This field has the same meaning for all calendar systems.
"
shared object hourPerDay extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 23;
			maximumLargest = 23;
		};
	}

	shared Integer getMaximumRepresentation() {
		return 24;
	}

}

doc 
"
	The am-pm-of-day.
	This counts the AM/PM within the day, from 0 (AM) to 1 (PM).
	This field has the same meaning for all calendar systems.
"
shared object amPmPerDay extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 1;
			maximumLargest = 1;
		};
	}

}

doc 
"
	The day-of-week, such as Tuesday.
	For ISO-8601, the days are numbered from Monday (1) to Sunday (7).
	This field may have a different meaning in a non-ISO calendar system.
"
shared object dayPerWeek extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 1;
			minimalLargest = 1;
			maximumSmallest = 7;
			maximumLargest = 7;
		};
	}

}

doc 
"
	The day-of-month.
	For ISO-8601, the days are numbered from 1 to 31 in most months.
	April, June, September, November have days from 1 to 30.
	February has days from 1 to 28, or 29 in a leap year.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object dayPerMonth extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 1;
			minimalLargest = 1;
			maximumSmallest = 28;
			maximumLargest = 31;
		};
	}

}

doc
"
	The day-of-year.
	For ISO-8601, the days are numbered from 1 to 365 in standard years and 1 to 366 in leap years.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object dayPerYear extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 1;
			minimalLargest = 1;
			maximumSmallest = 365;
			maximumLargest = 366;
		};
	}

}

doc 
"
	The epoch-day, based on the Java epoch of 1970-01-01 (ISO).
	This field is the sequential count of days where 1970-01-01 (ISO) is zero.
	Note that this uses the <i>local</i> time-line, ignoring offset and time-zone.
	All other date fields in this enum can have a different meaning in a non-ISO calendar system.
	By contrast, this field always has the same meaning, permitting interoperation between calendars.
"
shared object epochPerDay extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = ( year.range().getMinimum() * 365.25 ).integer;
			minimalLargest = ( year.range().getMinimum() * 365.25 ).integer;
			maximumSmallest = ( year.range().getMaximum() * 365.25 ).integer;
			maximumLargest = ( year.range().getMaximum() * 365.25 ).integer;
		};
	}

}

doc 
"
	The week within a month.
	The value of this field is a count of 7 day weeks within a month.
	For ISO-8601, the week starts on Monday and there must be at least 4 days in the first week.
	Week one is the week starting on a Monday where there are at least 4 days in the month.
	Thus, week one may start up to three days before the start of the month.
	If the first week starts after the start of the month then the period before is week zero.
	For example:
		- if the 1st day of the month is a Monday, week one starts on the 1st and there is no week zero<br />
		- if the 2nd day of the month is a Monday, week one starts on the 2nd and the 1st is in week zero<br />
		- if the 4th day of the month is a Monday, week one starts on the 4th and the 1st to 3rd is in week zero<br />
		- if the 5th day of the month is a Monday, week two starts on the 5th and the 1st to 4th is in week one<br />
	This field may have a different meaning in a non-ISO calendar system.
"
shared object weekPerMonth extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 1;
			maximumSmallest = 4;
			maximumLargest = 5;
		};
	}

}

doc
"
	The week within a year.
	The value of this field is a count of 7 day weeks within a year.
	For ISO-8601, the week starts on Monday and there must be at least 4 days in the first week.
	Week one is the week starting on a Monday where there are at least 4 days in the year.
	Thus, week one may start up to three days before the start of the year.
	If the first week starts after the start of the year then the period before is week zero.
	For example:
		- if the 1st day of the year is a Monday, week one starts on the 1st and there is no week zero<br />
		- if the 2nd day of the year is a Monday, week one starts on the 2nd and the 1st is in week zero<br />
		- if the 4th day of the year is a Monday, week one starts on the 4th and the 1st to 3rd is in week zero<br />
		- if the 5th day of the year is a Monday, week two starts on the 5th and the 1st to 4th is in week one<br />
	This field typically used with {@link #DAY_OF_WEEK}.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object weekPerYear extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 1;
			maximumSmallest = 52;
			maximumLargest = 53;
		};
	}

}

doc
"
	The month-of-year, such as March.
	For ISO-8601, the months are numbered from 1 to 12.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object monthPerYear extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 1;
			minimalLargest = 1;
			maximumSmallest = 12;
			maximumLargest = 12;
		};
	}

}

doc 
"
	The epoch month based on the Java epoch of 1970-01-01.
	For ISO-8601, the value is a sequential count of months where January 1970 is zero.
	Note that this uses the <i>local</i> time-line, ignoring offset and time-zone.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object epochPerMonth extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = (year.range().getMinimum() - 1970) * 12;
			minimalLargest = (year.range().getMinimum() - 1970) * 12;
			maximumSmallest = (year.range().getMaximum() - 1970) * 12 - 1;
			maximumLargest = (year.range().getMaximum() - 1970) * 12 - 1;
		};
	}

}

doc
"
	The year within the era.
	For ISO-8601, there are two eras, see {@code #ERA}.
	The year-of-era is always positive.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object yearPerEra extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 1;
			minimalLargest = 1;
			maximumSmallest = year.range().getMaximum();
			maximumLargest = year.range().getMaximum() + 1;
		};
	}

}

doc 
"
	The year, such as 2012.
	For ISO-8601, the standard ISO year.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object year extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = -999_999_999;
			minimalLargest = -999_999_999;
			maximumSmallest = 999_999_999;
			maximumLargest = 999_999_999;
		};
	}

}

doc 
"
	The era.
	For ISO-8601, there are two artificial eras.
	The current one is from year one onwards.
	The previous era is from year zero backwards.
	This field may have a different meaning in a non-ISO calendar system.
"
shared object era extends Field() {

	shared actual DateTimeValueRange range() {
		return DateTimeValueRange {
			minimalSmallest = 0;
			minimalLargest = 0;
			maximumSmallest = 1;
			maximumLargest = 1;
		};
	}

}
