import ceylon.time.base { Range }
shared abstract class Field( integer ) of TimeField|DateField
				satisfies Range & Numeric<Integer> & Number {


	shared actual Integer divided(Integer other) {
		return integer.divided(other);
	}

	shared actual Float float = integer.float;

	shared actual Number fractionalPart = integer.fractionalPart;

	shared actual Integer integer;

	shared actual Number magnitude = integer.magnitude;

	shared actual Integer minus(Integer other) {
		return integer.minus(other);
	}

	shared actual Boolean negative = integer.negative;

	shared actual Integer negativeValue = integer.negativeValue;

	shared actual Integer plus(Integer other) {
		return integer.plus(other);
	}

	shared actual Boolean positive = integer.positive;

	shared actual Integer positiveValue = integer.positiveValue;

	shared actual Integer sign = integer.sign;

	shared actual Integer times(Integer other) {
		return integer.times(other);
	}

	shared actual Number wholePart = integer.wholePart;

	//TODO: Need a correct equals implementation
	shared actual Boolean equals( Object other ) {
		if ( is Integer other ) {
			return integer.equals(other);
		}
		return false;
	}

	shared actual Integer hash {
		//TODO: Need a correct hash implementation
		return integer.hash * 31;
	}

}