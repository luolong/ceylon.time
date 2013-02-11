import ceylon.test { suite }

void run() {
    suite {
        suiteName = "ceylon.time";
        tests = [
            "Weekdays" -> testDayOfWeek,
            "Date" -> testDates,
            "Time" -> testTimes,
            "DateTime" -> testDateTime
        ];
    };
}