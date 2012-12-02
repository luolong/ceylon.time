import ceylon.time { createDate = date }
import ceylon.time.base { ReadableTime, ReadableDate, MonthOfYear, DateTimeBehavior }
import ceylon.time.impl { GregorianDateTime }

doc "An abstract moment in time (like _4pm, October 21. 2012_).

     DateTime does not contain a time zone information, so You can not use it to record or 
     schedule events."
shared interface DateTime 
    satisfies ReadableDate & ReadableTime
            & DateTimeBehavior<DateTime, Date, Time> 
            & Ordinal<DateTime>
            & Comparable<DateTime> {

}

doc "Returns a date based on the specified year, month and day-ofMonth values"
shared DateTime dateTime(Integer year, Integer|MonthOfYear month, Integer date, Integer hour = 0, Integer minutes=0, Integer seconds=0, Integer millis=0){
    return GregorianDateTime( createDate( year, month, date), time( hour, minutes, seconds, millis ));
}