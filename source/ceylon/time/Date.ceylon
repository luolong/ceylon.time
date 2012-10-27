
import ceylon.time.base { ReadableDate, asDayOfWeek = dayOfWeek, MonthOfYear, DayOfWeek, january, monthOfYear, february, march, april, may, june, july, august, september, october, november, december, DateBehavior }

doc "An interface for date objects in the ISO-8601 calendar system,
	
	A date is often viewed as triple of year-month-day values. 
	This interface also defines access to other date fields such as 
	day-of-year, day-of-week and week-of-year."
shared interface Date
		satisfies ReadableDate & DateBehavior<Date> & Ordinal<Date> & Comparable<Date>{
		
	//TODO: Should it go to ReadableDate? 
	doc "number of calendar days since ERA"
	shared formal Integer dayOfEra;
	
}

//TODO: what?
abstract class Algorithm() {
	shared formal Integer year();
	shared formal Integer month();
	shared formal Integer day();
	shared formal Boolean leapYear();
}

abstract class AbstractDate(dayOfEra)
	satisfies Date {
	
	shared actual Integer dayOfEra;
	
	shared actual Comparison compare(Date other) {
		return dayOfEra <=> other.dayOfEra;
	}
	
	shared actual Integer distanceFrom(Date other) {
		return dayOfEra.distanceFrom(other.dayOfEra);
	}
}

doc "Default implementation of a gregorian calendar"
class GregorianDate(Integer d) 
	  extends AbstractDate(d){

	Integer daysPerCycle = 146097;
    /**
     * The number of days from year zero to year 1970.
     * There are five 400 year cycles from year zero to 2000.
     * There are 7 leap years from 1970 to 2000.
     */
    Integer days_0000_TO_1970 = (daysPerCycle * 5) - (30 * 365 + 7);
		
	// Compute date values from the provided date
	variable Integer y := (10000*d + 14780)/3652425;
	variable Integer ddd := d - (365*y + y/4 - y/100 + y/400);
	if (ddd < 0) {
		y -= 1;
		ddd := d - (365*y + y/4 - y/100 + y/400);
	}
	
	value mi = (100*ddd + 52)/3060;
	value mm = (mi + 2)%12 + 1;
	y += (mi + 2)/12;
	value dd = ddd - (mi*306 + 5)/10 + 1;
	
	shared actual Integer dayOfMonth = dd;
	shared actual MonthOfYear month = monthOfYear(mm);
	shared actual Integer year = y;
	
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
		return GregorianDate( dayOfEra - 1 );
	}
	
	shared actual GregorianDate successor {
		return GregorianDate( dayOfEra + 1 );
	}

	shared Integer toEpochDay() {
        value y = year;
        value m = month;
        variable Integer total := 0;
        total += 365 * y;
        if (y >= 0) {
            total += (y + 3) / 4 - (y + 99) / 100 + (y + 399) / 400;
        } else {
            total -= y / -4 - y / -100 + y / -400;
        }
        total += ((367 * m.integer - 362) / 12);
        total += dayOfMonth - 1;
        if (m.integer > 2) {
            total--;
            if ( leapYear == false) {
                total--;
            }
        }
        return total - days_0000_TO_1970;
    }
 
	shared actual DayOfWeek dayOfWeek {
        value dow0 = floorMod(toEpochDay() + 3, 7);
        return asDayOfWeek(dow0 + 1);
    }

	shared actual Date minusDays(Integer days) {
    	return bottom;
    }
    shared actual Date minusMonths(Integer months) {
    	return bottom;
    }
    shared actual Date minusYears(Integer years) {
    	return bottom;
    }
    shared actual Date normalized() {
    	return bottom;
    }
    shared actual Date plus(Date other) {
    	return bottom;
    }
    shared actual Date plusDays(Integer days) {
    	return bottom;
    }
    shared actual Date plusMonths(Integer months) {
    	return bottom;
    }
    shared actual Date plusYears(Integer years) {
    	return bottom;
    }
    shared actual Date withDays(Integer days) {
    	return bottom;
    }
    shared actual Date withMonths(Integer months) {
    	return bottom;
    }
    shared actual Date withYears(Integer years) {
    	return bottom;
    }

}  

/*
class JulianDate(Integer dayOfEra) 
		extends DateImpl(dayOfEra) {
	
	shared actual Algorithm calculated = Julian(dayofEra);
}
*/

Integer floorMod(Integer a, Integer b) {
    return (((a % b) + b) % b);
}

shared Integer firstDayOfYear( MonthOfYear month, Boolean leapYear ) {
        value leap = leapYear then 1 else 0;
        switch (month)
        case ( january) {
            return 1;
		}
        case ( february ) {
            return 32;
		}
        case ( march ) {
            return 60 + leap;
		}
        case ( april ) {
            return 91 + leap;
		}
        case ( may ) {
            return 121 + leap;
		}
        case ( june ) {
            return 152 + leap;
		}
        case ( july ) {
            return 182 + leap;
		}
        case ( august ) {
            return 213 + leap;
		}
        case ( september ) {
            return 244 + leap;
		}
        case ( october ) {
            return 274 + leap;
		}
        case ( november ) {
            return 305 + leap;
		}
        case ( december ) {
            return 335 + leap;
		}
    }

doc "parses a Date from ISO date formatted string (YYYY-MM-DD)"
shared Date parseDate(String string){
	return bottom;
}


doc "Returns a date based on the specified year, month and day-ofMonth values"
shared Date date(Integer year, Integer|MonthOfYear month, Integer date){
	value m = monthOfYear(month);
	//if (year > 1582 || (year == 1582 && m <= march)){
	//	return JulianDate()
	//}
	return GregorianDate(g(year, m.integer, date));
}

doc "Calculates the number of days according to gregorian calendar rules"
Integer g(Integer yyyy, Integer mm, Integer d) {
	value m = (mm + 9) % 12;
	value y = yyyy - m/10;
	return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}

doc "Calculates the number of days according to julian calendar rules"
Integer j(Integer yyyy, Integer mm, Integer d) {
	value m = (mm + 9) % 12;
	value y = yyyy - m/10;
	return 365*y + y/4 - y/100 + y/400 + (m*306 + 5)/10 + ( d - 1 );
}
