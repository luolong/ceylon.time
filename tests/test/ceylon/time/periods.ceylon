import ceylon.test { assertEquals }
import ceylon.time { Period }

Period oneSecond = Period {
    seconds = 1;
};

Period oneYear = Period {
    years = 1;
};

Period oneHalfYear = Period {
    years = 1;
    months = 6;
};

Period twelveMonths = Period {
    months = 12;
};

Period oneYear2Months3Days4Hours5Minutes6Seconds7Milliseconds = Period {
    years = 1;
    months = 2;
    days = 3;
    hours = 4;
    minutes = 5;
    seconds = 6;
    milliseconds = 7;
};

shared void testEquals_Periods() {
    assertEquals( oneYear, twelveMonths.normalized() );
}

shared void testPlusMonths_Periods() {
    assertEquals( oneHalfYear, twelveMonths.normalized().plusMonths(6) );
}

shared void testMinusMonths_Periods() {
    assertEquals( oneYear, oneHalfYear.minusMonths(6) );
}

shared void testComparable_Periods() {
    assertEquals( oneYear <=> twelveMonths, equal );
    assertEquals( oneYear < oneHalfYear, true );
    assertEquals( oneHalfYear > twelveMonths, true );
}
