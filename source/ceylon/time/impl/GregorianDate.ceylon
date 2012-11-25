import ceylon.time.base { monthOfYear, MonthOfYear, DayOfWeek, asDayOfWeek = dayOfWeek }
import ceylon.time { gregorian }
import ceylon.time.impl { calcLeapYear = leapYear }
doc "Default implementation of a gregorian calendar"
shared class GregorianDate( Integer dayOfEra ) 
	  extends AbstractDate( dayOfEra ) {
	
	// Compute date values from the provided date
	variable Integer y := (10000*dayOfEra + 14780)/3652425;
	variable Integer ddd := dayOfEra - (365*y + y/4 - y/100 + y/400);
	if (ddd < 0) {
		y -= 1;
		ddd := dayOfEra - (365*y + y/4 - y/100 + y/400);
	}

	value mi = (100*ddd + 52)/3060;
	value mm = (mi + 2)%12 + 1;
	y += (mi + 2)/12;
	value dd = ddd - (mi*306 + 5)/10 + 1;

	shared actual Integer dayOfMonth = dd;
	shared actual MonthOfYear month = monthOfYear(mm);
	shared actual Integer year = y;
	
	doc " The number of days in a 400 year cycle."
	shared Integer daysPerCycle = 146097;
	
	doc "
	    	The number of days from year zero to year 1970.
	    	There are five 400 year cycles from year zero to 2000.
	    	There are 7 leap years from 1970 to 2000.
	    "
	shared Integer days_0000_TO_1970 = (daysPerCycle * 5) - (30 * 365 + 7);
	
	//TODO: Implement
	shared actual Integer weekOfYear = 0;
	
	doc "True, if this date is a leap year according to gregorian clendar leap year rules."
	shared actual Boolean leapYear = calcLeapYear( year );

	shared actual Integer dayOfYear = firstDayOfYear( month, leapYear ) + dayOfMonth -1;
	
	shared actual GregorianDate predecessor {
		return minusDays( 1 );
	}
	
	shared actual GregorianDate successor {
		return plusDays(1);
	}

	shared Integer epochDay {
        variable Integer total := 0;
        total += 365 * year;
        if (year >= 0) {
            total += (year + 3) / 4 - (year + 99) / 100 + (year + 399) / 400;
        } else {
            total -= year / -4 - year / -100 + year / -400;
        }
        total += ((367 * month.integer - 362) / 12);
        total += dayOfMonth - 1;
        if (month.integer > 2) {
            total--;
            if ( leapYear == false) {
                total--;
            }
        }
        return total - days_0000_TO_1970;
    }
 
	shared actual DayOfWeek dayOfWeek {
        value dow0 = floorMod( epochDay + 3, 7);
        return asDayOfWeek(dow0 + 1);
    }

	shared actual GregorianDate minusDays(Integer days) {
    	return plusDays(-days);
    }
    shared actual GregorianDate minusMonths(Integer months) {
    	return plusMonths(-months);
    }
    shared actual GregorianDate minusYears(Integer years) {
    	return plusYears(-years);
    }

    shared actual GregorianDate plusDays(Integer days) {
		if ( days == 0 ) {
			return this;
		}
    	return GregorianDate( dayOfEra + days );
    }
    shared actual GregorianDate plusMonths(Integer months) {
		if ( months == 0 ) {
			return this;
		}

		Integer totalMonths = year * 12 + ( month.integer - 1);
		Integer calculedMonths = totalMonths + months;

		Integer newYear = calculedMonths / 12; 
		Integer newMonth = floorMod(calculedMonths, 12) + 1;

    	return GregorianDate( gregorian(newYear, newMonth, resolveLastValidDay(newMonth, dayOfMonth, leapYear) ));
    }
    
    shared actual GregorianDate plusYears(Integer years) {
    	if ( years == 0 ) {
    		return this;    	}
    	
    	Integer newYear = year + years;
    	return GregorianDate( gregorian(newYear, month.integer, resolveLastValidDay(month, dayOfMonth, calcLeapYear(newYear) )));
    }
    
    shared actual GregorianDate plusWeeks(Integer weeks) {
    	if ( weeks == 0 ) {
    		return this;
    	}
    	return plusDays( weeks * 7 );
    }
    
    shared actual GregorianDate minusWeeks(Integer weeks) {
    	if ( weeks == 0 ) {
    		return this;
    	}
    	return minusDays( weeks * 7 );
    }
    
    shared actual GregorianDate withDayOfMonth(Integer day) {
        if ( day == dayOfMonth ) {
            return this;
        }
    	return GregorianDate( dayOfEra - dayOfMonth + resolveLastValidDay(month, day, leapYear));
    }
    shared actual GregorianDate withMonth(Integer|MonthOfYear month) {
        MonthOfYear newMonth = monthOfYear(month);
        if ( month == this.month ) {
            return this;
        }
        
    	return GregorianDate( gregorian(year, newMonth.integer, resolveLastValidDay(newMonth, dayOfMonth, leapYear) ));
    }
    shared actual GregorianDate withYear(Integer year) {
    	if ( year == this.year ) {
    		return this;
    	}
		return GregorianDate( gregorian(year, month.integer, resolveLastValidDay(month, dayOfMonth, calcLeapYear(year)) ));
    }
    
    shared actual Boolean equals( Object other ) {
        if (is GregorianDate other) {
			if (this === other){
				return true;
			}
			
			return (this.year == other.year
			     && this.month==other.month
			     && this.dayOfMonth==other.dayOfMonth );
		}
		return false;
    }

	shared actual String string {
		return "" year "-" pad(month.integer) "-" pad( dayOfMonth ) "";
	}

} 