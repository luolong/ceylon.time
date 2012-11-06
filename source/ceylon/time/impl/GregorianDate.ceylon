import ceylon.time.base { monthOfYear, MonthOfYear, DayOfWeek, asDayOfWeek = dayOfWeek }
import ceylon.time { Date }
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
	shared actual Boolean leapYear {
		if (year % 400 == 0){
			return true;
		}
		
		if (year % 100 == 0){
			return false;
		}
		
		if (year % 4 == 0){
			return true;
		}
		
		return false;
	}

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
    	return bottom;
    }
    shared actual GregorianDate minusMonths(Integer months) {
    	return bottom;
    }
    shared actual GregorianDate minusYears(Integer years) {
    	return bottom;
    }
    shared actual GregorianDate normalized() {
    	return bottom;
    }
    shared actual GregorianDate plus(Date other) {
    	return bottom;
    }
    shared actual GregorianDate plusDays(Integer days) {
    	return bottom;
    }
    shared actual GregorianDate plusMonths(Integer months) {
    	return bottom;
    }
    shared actual GregorianDate plusYears(Integer years) {
    	return bottom;
    }
    shared actual GregorianDate withDays(Integer days) {
    	return bottom;
    }
    shared actual GregorianDate withMonths(Integer months) {
    	return bottom;
    }
    shared actual GregorianDate withYears(Integer years) {
    	return bottom;
    }

} 