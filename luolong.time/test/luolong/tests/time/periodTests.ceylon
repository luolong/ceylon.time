import luolong.time.period{...}

shared void periodTests(){
	
    print("Period constants, equality");
	assert( zero == zero, "zero == zero" );
	assert( zero == Period(0, 0, 0, 0, 0, 0, 0), "zero == Period(0, 0, 0, 0, 0, 0, 0)" );
	
	assert( oneYear == oneYear, "oneYear == oneYear" );
	assert( oneYear == years(1), "oneYear == years(1)" );
	assert( years(1) == Period { years=1; }, "years(1) == Period { years=1; }" );
	
	assert( oneMonth == oneMonth, "oneMonth == oneMonth" );
	assert( oneMonth == months(1), "oneMonth == months(1)" );
	assert( months(1) == Period { months=1; }, "months(1) == Period { months=1; }" );
	
	assert( oneDay == oneDay, "oneDay == oneDay" );
	assert( oneDay == days(1), "oneDay == days(1)" );
	assert( days(1) == Period { days=1; }, "days(1) == Period { days=1; }" );
	
	assert( oneHour == oneHour, "oneHour == oneHour" );
	assert( oneHour == hours(1), "oneHour == hours(1)" );
	assert( hours(1) == Period { hours=1; }, "hours(1) == Period { hours=1; }" );
	
	assert( oneMinute == oneMinute, "oneMinute == oneMinute" );
	assert( oneMinute == minutes(1), "oneMinute == minutes(1)" );
	assert( minutes(1) == Period { minutes=1; }, "minutes(1) == Period { minutes=1; }" );
	
	assert( oneSecond == oneSecond, "oneSecond == oneSecond" );
	assert( oneSecond == seconds(1), "oneSecond == seconds(1)");
	assert( seconds(1) == Period { seconds=1; }, "seconds(1) == Period { seconds=1; }" );
	
	print("Period initialization, equality");
	assert( nanos(1) == Period { nanos=1; }, "nanos(1) == Period { nanos=1; }" );
	
	print("Period with...");
	assert( zero.withYears(1) == years(1), "zero.withYears(1) == years(1)");
	assert( zero.withMonths(1) == months(1), "zero.withMonths(1) == months(1)");
	assert( zero.withDays(1) == days(1), "zero.withDays(1) == days(1)");
	assert( zero.withHours(1) == hours(1), "zero.withHours(1) == hours(1)");
	assert( zero.withMinutes(1) == minutes(1), "zero.withMinutes(1) == minutes(1)");
	assert( zero.withSeconds(1) == seconds(1), "zero.withSeconds(1) == seconds(1)");
	assert( zero.withNanos(1) == nanos(1), "zero.withNanos(1) == nanos(1)");
	
}