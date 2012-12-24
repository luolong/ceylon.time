shared object months extends DateField(1) {
	shared Integer perYear = 12;
	
	shared actual Integer maximumLargest = 12;
	shared actual Integer maximumSmallest = 12;
	shared actual Integer minimalLargest = 1;
	shared actual Integer minimalSmallest = 1;
}