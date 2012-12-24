shared object minutes extends TimeField(60) {
	shared Integer perDay = 1440;
	
	shared actual Integer maximumLargest = 59;
	shared actual Integer maximumSmallest = 59;
	shared actual Integer minimalLargest = 0;
	shared actual Integer minimalSmallest = 0;
}