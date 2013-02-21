shared interface PeriodBehavior<Element> of Element 
       given Element satisfies PeriodBehavior<Element>
                             & ReadablePeriod {

    doc "Returns a copy of this period with the specified amount of years."
    shared formal Element withYears(Integer year);

    doc "Returns a copy of this period with the specified amount of months."
    shared formal Element withMonths(Integer month);

    doc "Returns a copy of this period with the specified amount of days."
    shared formal Element withDays(Integer daysOfMonth);

    doc "Returns a copy of this period with the specified number of years added."
    shared formal Element plusYears(Integer years);

    doc "Returns a copy of this period with the specified number of months added."
    shared formal Element plusMonths(Integer months);

    doc "Returns a copy of this period with the specified number of days added."
    shared formal Element plusDays(Integer days);

    doc "Returns a copy of this period with the specified number of years subtracted."
    shared formal Element minusYears(Integer years);

    doc "Returns a copy of this period with the specified number of months subtracted."
    shared formal Element minusMonths(Integer months);

    doc "Returns a copy of this period with the specified number of days subtracted."
    shared formal Element minusDays(Integer days);

    doc "Returns a copy of this period with the specified amount of hours."
    shared formal Element withHours(Integer hours);

    doc "Returns a copy of this period with the specified amount of minutes."
    shared formal Element withMinutes(Integer minutes);

    doc "Returns a copy of this period with the specified amount of seconds."
    shared formal Element withSeconds(Integer seconds);

    doc "Returns a copy of this period with the specified amount of nanos."
    shared formal Element withMilliseconds(Integer milliseconds);

    doc "Returns a copy of this period with the specified number of hours added."
    shared formal Element plusHours(Integer hours);

    doc "Returns a copy of this period with the specified number of minutes added."
    shared formal Element plusMinutes(Integer minutes);

    doc "Returns a copy of this period with the specified number of seconds added."
    shared formal Element plusSeconds(Integer seconds);

    doc "Returns a copy of this period with the specified number of nonoseconds added."
    shared formal Element plusMilliseconds(Integer milliseconds);

    doc "Returns a copy of this period with the specified number of hours subtracted."
    shared formal Element minusHours(Integer hours);

    doc "Returns a copy of this period with the specified number of minutes subtracted."
    shared formal Element minusMinutes(Integer minutes);

    doc "Returns a copy of this period with the specified number of seconds subtracted."
    shared formal Element minusSeconds(Integer seconds);

    doc "Returns a copy of this period with the specified number of nonoseconds subtracted."
    shared formal Element minusMilliseconds(Integer milliseconds);

    doc "Returns a copy of this period with all amounts normalized to the 
         standard ranges for date-time fields.
         
         Two normalizations occur, one for years and months, and one for
         hours, minutes, seconds and nanoseconds.
         
         Days are not normalized, as a day may vary in length at daylight savings cutover.
         Neither is days normalized into months, as number of days per month varies from 
         month to another and depending on the leap year."
    shared formal PeriodBehavior<Element> normalized();
}