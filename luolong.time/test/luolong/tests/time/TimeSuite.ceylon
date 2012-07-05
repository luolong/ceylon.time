doc "Test time suite."
class TimeSuite() extends Suite("luolong.time"){
	shared actual Iterable<Entry<String, Callable<Void>>> suite = {
        "Period" -> periodTests
    };
}

shared void run() {
    TimeSuite().run();
}