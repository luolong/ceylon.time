import ceylon.time { Date, Time }
shared interface DateTimeBehavior<Element, out DateType, out TimeType>
    satisfies DateBehavior<Element> & TimeBehavior<Element>
    given Element satisfies DateTimeBehavior<Element, DateType, TimeType>
                             & ReadableDate
                             & ReadableTime
    given DateType satisfies Date
    given TimeType satisfies Time {

    shared formal TimeType time;

    shared formal DateType date;

}