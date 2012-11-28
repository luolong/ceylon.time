import com.redhat.ceylon.sdk.test { Suite }

class TimeSuite() extends Suite("ceylon.time") {
    shared actual Iterable<String->Void()> suite = {
        "Weekdays" -> testDayOfWeek,
        "Date" -> testDates,
        "Times" -> testTimes
    };
}

void run() {
    TimeSuite().run();
}