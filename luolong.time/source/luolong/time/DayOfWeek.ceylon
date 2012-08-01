shared class WeekdayParseError(String message)
       extends Exception(message) {}

shared DayOfWeek parseDayOfWeek(String weekday){
	if (weekday == "monday") { return monday; }
	if (weekday == "tuesday") { return tuesday; }
	if (weekday == "wednesday") { return wednesday; }
	if (weekday == "thursday") { return thursday; }
	if (weekday == "friday") { return friday; }
	if (weekday == "saturday") { return saturday; }
	if (weekday == "sunday") { return sunday; }
	
	throw WeekdayParseError("Unrecognized weekday: " weekday "." );
}

shared DayOfWeek dayOfWeek(Integer number){
	if (number == 1) { return monday; }
	if (number == 2) { return tuesday; }
	if (number == 3) { return wednesday; }
	if (number == 4) { return thursday; }
	if (number == 5) { return friday; }
	if (number == 6) { return saturday; }
	if (number == 7) { return sunday; }
	
	throw Exception("Not a valid weekday number: " number "." );
}

doc "A day-of-week, such as 'Tuesday'."
//literal {
//	format = 'monday|tuesday|wednesday|thursday|friday|saturday|sunday';
//	parser = parseDayOfWeek;
//}
shared abstract class DayOfWeek(integer) 
	   of monday | tuesday | wednesday | thursday | friday | saturday | sunday 
       satisfies Ordinal<DayOfWeek>{
	
	doc "Numeric value of the weekday"
	shared Integer integer;

	doc "Shifts day of week specified number of times, 
		returning a tuple "
	shared Shift<DayOfWeek> shift(Integer number){
		value integer = this.integer + number;
		variable Integer reminder := integer % 7;
		variable DayOfWeek dow := this;
		
		// shift the value
		while (reminder > 0) {
			dow := dow.successor;
			reminder -= 1;
		}
		while (reminder < 0){
			dow := dow.predecessor;
			reminder += 1;
		}
		 
		object result satisfies Shift<DayOfWeek> {
		    shared actual DayOfWeek result = dow;
		    shared actual Integer wraps = integer / 7;
		}
		return result;
	}
}

shared object monday extends DayOfWeek(1) {
	shared actual String string = "monday";
	shared actual DayOfWeek predecessor = sunday;
	shared actual DayOfWeek successor = tuesday;
}

shared object tuesday extends DayOfWeek(2) {
	shared actual String string = "tuesday";
	shared actual DayOfWeek predecessor = monday;
	shared actual DayOfWeek successor = wednesday;
}

shared object wednesday extends DayOfWeek(3) {
	shared actual String string = "wednesday";
	shared actual DayOfWeek predecessor = tuesday;
	shared actual DayOfWeek successor = thursday;
}

shared object thursday extends DayOfWeek(4) {
	shared actual String string = "thursday";
	shared actual DayOfWeek predecessor = wednesday;
	shared actual DayOfWeek successor = friday;
}

shared object friday extends DayOfWeek(5) {
	shared actual String string = "friday";
	shared actual DayOfWeek predecessor = thursday;
	shared actual DayOfWeek successor = saturday;
}

shared object saturday extends DayOfWeek(6) {
	shared actual String string = "saturday";
	shared actual DayOfWeek predecessor = friday;
	shared actual DayOfWeek successor = sunday;
}

shared object sunday extends DayOfWeek(7) {
	shared actual String string = "sunday";
	shared actual DayOfWeek predecessor = saturday;
	shared actual DayOfWeek successor = monday;
}