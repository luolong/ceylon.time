import com.redhat.ceylon.sdk.test { Suite }

class TimeSuite() extends Suite("ceylon.time") {
    shared actual Iterable<String->Void()> suite = {
        "Weekdays" -> testDayOfWeek,
        "Date" -> testDates,
        "Time" -> testTimes,
        "DateTime" -> testDateTime
    };
}

void run() {
    TimeSuite().run(); 
}