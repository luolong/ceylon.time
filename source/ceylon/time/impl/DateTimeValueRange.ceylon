import ceylon.time.base { DateTimeException }
doc "
 
/**
 * The range of valid values for a date-time field.
 * <p>
 * All {@link DateTimeField} instances have a valid range of values.
 * For example, the ISO day-of-month runs from 1 to somewhere between 28 and 31.
 * This class captures that valid range.
 * <p>
 * Instances of this class are not tied to a specific rule
 * 
 * <h4>Implementation notes</h4>
 * This class is immutable and thread-safe.
 */
"
shared class DateTimeValueRange( minimalSmallest, minimalLargest, maximumSmallest, maximumLargest ) {
    
    doc "The smallest minimum value."
    Integer minimalSmallest;
    
	doc "The largest minimum value."
    Integer minimalLargest;
    
	doc "The smallest maximum value."
	Integer maximumSmallest;
	
    doc "The largest maximum value."
    Integer maximumLargest;

	doc "Smallest minimum value must be less than largest minimum value"
	assert( minimalSmallest <= minimalLargest );	
	
	doc "Smallest maximum value must be less than largest maximum value"
	assert( maximumSmallest <= maximumLargest );
	
	doc "Minimum value must be less than maximum value"
	assert( minimalSmallest <= maximumLargest );

    //-----------------------------------------------------------------------
    /**
     * Is the value range fixed and fully known.
     * <p>
     * For example, the ISO day-of-month runs from 1 to between 28 and 31.
     * Since there is uncertainty about the maximum value, the range is not fixed.
     * However, for the month of January, the range is always 1 to 31, thus it is fixed.
     *
     * @return true if the set of values is fixed
     */
    shared Boolean isFixed() {
        return minimalSmallest == minimalLargest && maximumSmallest == maximumLargest;
    }

    //-----------------------------------------------------------------------
    /**
     * Gets the minimum value that the field can take.
     * <p>
     * For example, the ISO day-of-month always starts at 1.
     * The minimum is therefore 1.
     *
     * @return the minimum value for this field
     */
    shared Integer getMinimum() {
        return minimalSmallest;
    }

    /**
     * Gets the largest possible minimum value that the field can take.
     * <p>
     * For example, the ISO day-of-month always starts at 1.
     * The largest minimum is therefore 1.
     *
     * @return the largest possible minimum value for this field
     */
    shared Integer getLargestMinimum() {
        return minimalLargest;
    }

    /**
     * Gets the smallest possible maximum value that the field can take.
     * <p>
     * For example, the ISO day-of-month runs to between 28 and 31 days.
     * The smallest maximum is therefore 28.
     *
     * @return the smallest possible maximum value for this field
     */
    shared Integer getSmallestMaximum() {
        return maximumSmallest;
    }

    /**
     * Gets the maximum value that the field can take.
     * <p>
     * For example, the ISO day-of-month runs to between 28 and 31 days.
     * The maximum is therefore 31.
     *
     * @return the maximum value for this field
     */
    shared Integer getMaximum() {
        return maximumLargest;
    }

    ////-----------------------------------------------------------------------
    ///**
    // * Checks if all values in the range fit in an {@code int}.
    // * <p>
    // * This checks that all valid values are within the bounds of an {@code int}.
    // * <p>
    // * For example, the ISO month-of-year has values from 1 to 12, which fits in an {@code int}.
    // * By comparison, ISO nano-of-day runs from 1 to 86,400,000,000,000 which does not fit in an {@code int}.
    // * <p>
    // * This implementation uses {@link #getMinimum()} and {@link #getMaximum()}.
    // *
    // * @return true if a valid value always fits in an {@code int}
    // */
    //shared Boolean isIntValue() {
    //    return getMinimum() >= Integer.MIN_VALUE && getMaximum() <= Integer.MAX_VALUE;
    //}

    /**
     * Checks if the value is within the valid range.
     * <p>
     * This checks that the value is within the stored range of values.
     *
     * @param value  the value to check
     * @return true if the value is valid
     */
    shared Boolean isValidValue(Integer valor) {
        return (valor >= getMinimum() && valor <= getMaximum());
    }

    /**
     * Checks that the specified value is valid.
     * <p>
     * This validates that the value is within the valid range of values.
     * The field is only used to improve the error message.
     * 
     * @param value  the value to check
     * @param field  the field being checked, may be null
     * @return the value that was passed in
     * @see #isValidValue(long)
     */
    shared Integer checkValidValue(Integer valor, DateTimeField field) {
        if (isValidValue(valor) == false) {
            throw DateTimeException("Invalid value (valid values " this "): " valor "" );
        }
        return valor;
    }

    //-----------------------------------------------------------------------
    shared actual Boolean equals(Object obj) {
        if (is DateTimeValueRange obj ) {
            if (obj == this) {
            	return true;
        	}
           return minimalSmallest == obj.minimalSmallest && minimalLargest == obj.minimalLargest &&
                   maximumSmallest == obj.maximumSmallest && maximumLargest == obj.maximumLargest;
        }
        return false;
    }

}