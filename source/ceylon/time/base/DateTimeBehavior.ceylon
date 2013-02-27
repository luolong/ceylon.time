import ceylon.time.timezone { TimeZone }
import ceylon.time { Instant }

shared interface DateTimeBehavior<Element, out DateType, out TimeType> of Element
       satisfies DateBehavior<Element>
               & TimeBehavior<Element>
       given Element satisfies ReadableDateTime 
       given DateType satisfies ReadableDate
       given TimeType satisfies ReadableTime {

    doc "Returns Time portion of this [[DateTime]] value."
    shared formal TimeType time;

    doc "Returns Date portion of this [[DateTime]] value."
    shared formal DateType date;

    shared formal Instant instant(TimeZone? zone = null);

}
