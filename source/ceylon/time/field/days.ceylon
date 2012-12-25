shared object days extends DateField() {
	shared Integer perWeek = 7;
	
	shared actual Integer maximumLargest = 31;
	shared actual Integer maximumSmallest = 28;
	shared actual Integer minimalLargest = 1;
	shared actual Integer minimalSmallest = 1;
}