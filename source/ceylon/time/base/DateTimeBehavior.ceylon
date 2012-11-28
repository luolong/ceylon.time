shared interface DateTimeBehavior<Element>
       satisfies DateBehavior<Element> 
               & TimeBehavior<Element>
       given Element satisfies DateTimeBehavior<Element>
                             & ReadableDate
                             & ReadableTime {

	shared formal Element toTimeOnly();

	shared formal Element toDateOnly();

}