import ceylon.math.float { log10 }
import ceylon.time.base { MonthOfYear, january, february, march, april, may, june, july, august, september, october, november, december }

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


doc "return padded value"
String pad(Integer number, String padding = "00"){
	if (number == 0){
		return padding;
	}
	
	value digits = log10( number.magnitude.float ).wholePart.integer + 1;
	if (digits < padding.size) {
		value padded = padding.plus( number.string );
		return padded.segment(
				padded.size - padding.size,
				padding.size );
	}
	
	return number.string;
}