doc "A field of date/time.

     A date, as expressed by [[DateTime]], is broken down into a number of fields, 
     such as year, month, day-of-month, hour, minute and second.

     Implementations of this interface represent those fields.
     The fields include their own calculations which are specific to one calendar system.

     Implementation notes
     ====================

     This interface must be implemented with care to ensure other classes operate correctly.
     All implementations that can be instantiated must be final, immutable and thread-safe.
     It is recommended to use an enum where possible."
shared interface DateTimeField  {

    doc "Gets the range of valid values for the field.

         All fields can be expressed as a {@code long} integer.
         This method returns an object that describes the valid range for that value.
         This method is generally only applicable to the ISO-8601 calendar system.

         Note that the result only describes the minimum and maximum valid values
         and it is important not to read too much into them. For example, there
         could be values within the range that are invalid for the field."
    shared formal DateTimeValueRange range();

}
