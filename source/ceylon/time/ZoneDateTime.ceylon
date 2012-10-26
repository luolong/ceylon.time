import ceylon.time.timezone { TimeZone }

doc "Instant of time in a specific time zone."
shared interface ZoneDateTime
		satisfies ReadableDate & ReadableTime
		          & Comparable<ZoneDateTime>
		          & Ordinal<ZoneDateTime>{
	
	doc "Time zone information of this date and time value."
	shared formal TimeZone timeZone;
}