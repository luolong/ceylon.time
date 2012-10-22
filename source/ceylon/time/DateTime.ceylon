
doc "Interface representing a time of day within a date (like _4pm, October 21. 2012_) 
without a reference to a time zone.
	
	This means that Date time instances for _4pm, October 21. 2012_ are all always equal
	een if created in different timezones. 
	
    "
shared interface DateTime 
	satisfies DateLike & TimeLike
              & Comparable<DateTime> & Ordinal<DateTime> {
	
}