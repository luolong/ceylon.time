
doc "Common behavior for date types"
shared interface DateBehavior<Element> of Element 
       given Element satisfies ReadableDate{

    doc "Returns a copy of this period with the specified year."
    shared formal Element withYear(Integer year);

    doc "Returns a copy of this period with the specified month of year."
    shared formal Element withMonth(Month month);

    doc "Returns a copy of this period with the specified amount of days."
    shared formal Element withDay(Integer dayOfMonth);

    doc "Returns a copy of this period with the specified number of years added."
    shared formal Element plusYears(Integer years);

    doc "Returns a copy of this period with the specified number of months added."
    shared formal Element plusMonths(Integer months);

    doc "Returns a copy of this period with the specified number of weeks added."
    shared formal Element plusWeeks(Integer weeks);

    doc "Returns a copy of this period with the specified number of days added."
    shared formal Element plusDays(Integer days);

    doc "Returns a copy of this period with the specified number of years subtracted."
    shared formal Element minusYears(Integer years);

    doc "Returns a copy of this period with the specified number of months subtracted."
    shared formal Element minusMonths(Integer months);

    doc "Returns a copy of this period with the specified number of weeks subtracted."
    shared formal Element minusWeeks(Integer weeks);

    doc "Returns a copy of this period with the specified number of days subtracted."
    shared formal Element minusDays(Integer days);

    doc "Returns a copy of this period with the specified period added."
    shared formal Element plus( ReadablePeriod amount );

    doc "Returns a copy of this period with the specified period subtracted."
    shared formal Element minus( ReadablePeriod amount );
}
