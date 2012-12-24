shared object seconds extends TimeField(60) {
	shared Integer perHour = 3600;
	shared Integer perDay = 86400;
	
	shared actual Integer maximumLargest = 59;
	shared actual Integer maximumSmallest = 59;
	shared actual Integer minimalLargest = 0;
	shared actual Integer minimalSmallest = 0;
}