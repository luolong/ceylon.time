shared object milliseconds extends TimeField() {
	shared Integer perSecond = 1000;
	shared Integer perMinute = 60000;
	shared Integer perHour = 3600000;
	shared Integer perDay = 86400000;
	
	shared actual Integer maximumLargest = 999;
	shared actual Integer maximumSmallest = 999;
	shared actual Integer minimalLargest = 0;
	shared actual Integer minimalSmallest = 0;
}
