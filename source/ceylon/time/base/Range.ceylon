shared interface Range {

	doc "The smallest minimum value."
    shared formal Integer minimalSmallest;

    doc "The largest minimum value."
    shared formal Integer minimalLargest;

    doc "The smallest maximum value."
    shared formal Integer maximumSmallest;

    doc "The largest maximum value."
    shared formal Integer maximumLargest;


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
    shared Integer checkValidValue(Integer valor) {
        if (isValidValue(valor) == false) {
            throw DateTimeException("Invalid value (valid values " this "): " valor "" );
        }
        return valor;
    }

}