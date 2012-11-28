shared interface TimeBehavior<Element> of Element
       given Element satisfies ReadableTime {

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

}