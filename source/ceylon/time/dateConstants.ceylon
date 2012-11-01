doc " The number of days in a 400 year cycle."
Integer daysPerCycle = 146097;

doc "
    	The number of days from year zero to year 1970.
    	There are five 400 year cycles from year zero to 2000.
    	There are 7 leap years from 1970 to 2000.
    "
Integer days_0000_TO_1970 = (daysPerCycle * 5) - (30 * 365 + 7);