doc "A constant for a period of zero."
shared Period zero = Period(0, 0, 0, 0, 0, 0, 0);

doc "A constant for a period of one second."
shared Period oneSecond = periodOf(1).seconds();

doc "A constant for a period of one minute."
shared Period oneMinute = periodOf(1).minutes();

doc "A constant for a period of one hour."
shared Period oneHour = periodOf(1).hours();

doc "A constant for a period of one day."
shared Period oneDay = periodOf(1).days();

doc "A constant for a period of one week (7 days)"
shared Period oneWeek = periodOf(1).days();

doc "A constant for a period of one month"
shared Period oneMonth = periodOf(1).months();

doc "A constant for a period of one year"
shared Period oneYear = periodOf(1).years();