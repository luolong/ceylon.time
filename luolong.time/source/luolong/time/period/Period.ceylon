import ceylon.math.whole{whole, Whole}

doc "Obtains a 'years' from a number of days."
shared Period years(Integer years){
	return Period{
		years=years;
	};
}

doc "Obtains a 'months' from a number of days."
shared Period months(Integer months){
	return Period{
		months=months;
	};
}

doc "Obtains a 'period' from a number of days."
shared Period days(Integer days){
	return Period{ 
		days=days; 
	};
}

doc "Obtains a 'period' from a number of hours"
shared Period hours(Integer hours){
	return Period{
		hours=hours;
	};
}

doc "Obtains a 'period' from a number of minutes"
shared Period minutes(Integer minutes){
	return Period{
		minutes=minutes;
	};
}

doc "Obtains a 'period' from a number of seconds"
shared Period seconds(Integer seconds){
	return Period{
		seconds=seconds;
	};
}

doc "Obtains a 'period' from a number of seconds"
shared Period nanos(Integer nanos){
	return Period{ 
		nanos=nanos;
	};
}


doc "An immutable period consisting of the ISO-8601 year, month, day, hour,
     minute, second and nanosecond units, such as '3 Months, 4 Days and 7 Hours'.
     
     A period is a human-scale description of an amount of time.
     "
shared class Period(years=0, months=0, days=0, hours=0, minutes=0, seconds=0, nanos=0)
		satisfies Comparable<Period> & 
                  Summable<Period>{

	doc "The number of years."
	shared Integer years;
	
	doc "The number of months"
	shared Integer months;
	
	doc "The number of days"
	shared Integer days;
	
	doc "The number of hours"
	shared Integer hours;
	
	doc "The number of minutes"
	shared Integer minutes;
	
	doc "The number of seconds"
	shared Integer seconds;
	
	doc "The number of nanoseconds"
	shared Integer nanos;
	
	doc "Checks if this period is equal to another period."
	shared actual Boolean equals(Object that){
		if (this == that){
			return true;
		}
		
		if (is Period that) {
			return (this.years==that.years
			     && this.months==that.years
			     && this.days==that.years
			     && this.hours==that.hours
			     && this.minutes==that.minutes
			     && this.seconds==that.seconds
			     && this.nanos==that.nanos);
		}
		
		return false;
	}
	
	shared actual Comparison compare(Period other) {
		return bottom;
	}
	
	doc "Checks if this period is zero-length."
	shared Boolean isZero(){
		return this == zero;
	}
	
	doc "Returns a copy of this period with the specified amount of years."
	shared Period withYears(Integer years){
		if (years == this.years){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified amount of months."
	shared Period withMonths(Integer months){
		if (months == this.months){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified amount of days."
	shared Period withDays(Integer days){
		if (days == this.days){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified amount of hours."
	shared Period withHours(Integer hours){
		if (hours == this.hours){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified amount of minutes."
	shared Period withMinutes(Integer minutes){
		if (minutes == this.minutes){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified amount of seconds."
	shared Period withSeconds(Integer seconds){
		if (seconds == this.seconds){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified amount of nanos."
	shared Period withNanos(Integer nanos){
		if (nanos == this.nanos){
			return this;
		}
		return Period(years, months, days, hours, minutes, seconds, nanos);
	}
	
	doc "Returns a copy of this period with the specified number of years added."
	shared Period plusYears(Integer years){
		if (years == 0){
			return this;
		}
		return withYears( this.years + years );
	}
	
	doc "Returns a copy of this period with the specified number of months added."
	shared Period plusMonths(Integer months){
		if (months == 0){
			return this;
		}
		return withMonths( this.months + months ).normalized();
	}
	
	doc "Returns a copy of this period with the specified number of days added."
	shared Period plusDays(Integer days){
		if (days == 0){
			return this;
		}
		return withDays( this.days + days );
	}
	
	doc "Returns a copy of this period with the specified number of hours added."
	shared Period plusHours(Integer hours){
		if (hours == 0){
			return this;
		}
		return withHours( this.hours + hours );
	}
	
	doc "Returns a copy of this period with the specified number of minutes added."
	shared Period plusMinutes(Integer minutes){
		if (minutes == 0){
			return this;
		}
		return withMinutes( this.minutes + minutes ).normalized();
	}
	
	doc "Returns a copy of this period with the specified number of seconds added."
	shared Period plusSeconds(Integer seconds){
		if (seconds == 0){
			return this;
		}
		return withSeconds( this.seconds + seconds ).normalized();
	}
	
	doc "Returns a copy of this period with the specified number of nonoseconds added."
	shared Period plusNanos(Integer nanos){
		if (nanos == 0){
			return this;
		}
		return withNanos( this.nanos + nanos ).normalized();
	}
	
	doc "Returns a new period that is a sum of the two periods."
	shared actual Period plus(Period other) {
		value years = this.years + other.years;
		value months = this.months + other.months;
		value days = this.days + other.days;
		value hours = this.hours + other.hours;
		value minutes = this.minutes + other.minutes;
		value seconds = this.seconds + other.seconds;
		value nanos = this.nanos + other.nanos;
		return Period(years, months, days, hours, minutes, seconds, nanos).normalized();
	}

	doc "Returns a copy of this period with all amounts normalized to the 
	standard ranges for date-time fields.
	
	Two normalizations occur, one for years and months, and one for
	hours, minutes, seconds and nanoseconds.
	
	Days are not normalized, as a day may vary in length at daylight savings cutover.
	Neither is days normalized into months, as number of days per month varies from 
	month to another and depending on the leap year.
	"
	shared Period normalized(){
        if (this == zero) {
            return zero;
        }
        
        value years = this.years + this.months / 12;
        value months = this.months % 12 ;
        
        variable Whole total := whole(this.hours * 60 * 60)
                              + whole(this.minutes * 60)
                              + whole(this.seconds);
        
        value nanos = whole(this.nanos).remainder( nanosPerSecond ).integer;
        total += whole(this.nanos).divided( nanosPerSecond );
        value seconds = total.remainder( secondsPerMinute ).integer;
        total := total.divided( secondsPerMinute );
        value minutes = total.remainder( minutesPerHour ).integer;
        value hours = total.divided( minutesPerHour ).integer;
        
        return Period(years, months, days, hours, minutes, seconds, nanos);
	}
}

Whole nanosPerSecond = whole(1000000000);
Whole secondsPerMinute = whole( 60 );
Whole minutesPerHour = secondsPerMinute;
