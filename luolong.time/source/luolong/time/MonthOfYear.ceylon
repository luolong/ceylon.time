shared abstract class MonthOfYear(number)
   of january | february | march | april | may | june | july | august | september | october | november | december
   satisfies Ordinal<MonthOfYear> & Comparable<MonthOfYear>{
	
	doc "Ordinal number of the month of year."
	shared Integer number;
	
	doc "Returns number of days in this month"
	shared default Integer numberOfDays(Boolean leapYear) {
		switch(this)
		case (february) { 
			if (leapYear) { return 29; }
			return 28;
		}
		case (april,june,september,november) { return 30; } 
		case (january,march,may,july,august,october,december) { return 31; }
	}
	
	doc "Compares ordinal numbers of two instances of `MonthOfYear`"
	shared actual Comparison compare(MonthOfYear other) {
		return number.compare(other.number);
	}
}

shared MonthOfYear[] months = {january, february, march, april, may, june, july, august, september, october, november, december};

shared object january extends MonthOfYear(1) {
	shared actual String string = "january";
	shared actual MonthOfYear predecessor = december;  
	shared actual MonthOfYear successor = february;
}

shared object february extends MonthOfYear(2) {
	shared actual String string = "february";
	shared actual MonthOfYear predecessor = january;  
	shared actual MonthOfYear successor = march;
}

shared object march extends MonthOfYear(3) {
	shared actual String string = "march";
	shared actual MonthOfYear predecessor = february;  
	shared actual MonthOfYear successor = april;
}

shared object april extends MonthOfYear(4) {
	shared actual String string = "april";
	shared actual MonthOfYear predecessor = march;  
	shared actual MonthOfYear successor = may;
}

shared object may extends MonthOfYear(5) {
	shared actual String string = "may";
	shared actual MonthOfYear predecessor = april;  
	shared actual MonthOfYear successor = june;
}

shared object june extends MonthOfYear(6) {
	shared actual String string = "june";
	shared actual MonthOfYear predecessor = may;
	shared actual MonthOfYear successor = july;
}

shared object july extends MonthOfYear(7) {
	shared actual shared actual String string = "july";
	shared actual MonthOfYear predecessor = june;  
	shared actual MonthOfYear successor = august;
}

shared object august extends MonthOfYear(8) {
	shared actual shared actual String string = "august";
	shared actual MonthOfYear predecessor = july;  
	shared actual MonthOfYear successor = september;
}

shared object september extends MonthOfYear(9) {
	shared actual shared actual String string = "september";
	shared actual MonthOfYear predecessor = august;  
	shared actual MonthOfYear successor = october;
}

shared object october extends MonthOfYear(10) {
	shared actual shared actual String string = "october";
	shared actual MonthOfYear predecessor = september;  
	shared actual MonthOfYear successor = november;
}

shared object november extends MonthOfYear(11) {
	shared actual shared actual String string = "november";
	shared actual MonthOfYear predecessor = october;  
	shared actual MonthOfYear successor = december;
}

shared object december extends MonthOfYear(12) {
	shared actual shared actual String string = "december";
	shared actual MonthOfYear predecessor = november;  
	shared actual MonthOfYear successor = january;
}
