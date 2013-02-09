import ceylon.test { assertEquals }
import ceylon.time.base { january, february, march, april, may, june, july, august, september, october, november, december, monthOf }

shared void test_january_number() => assertEquals(1, january.integer);
shared void test_february_number() => assertEquals(2, february.integer);
shared void test_march_number() => assertEquals(3, march.integer);
shared void test_april_number() => assertEquals(4, april.integer);
shared void test_may_number() => assertEquals(5, may.integer);
shared void test_june_number() => assertEquals(6, june.integer);
shared void test_july_number() => assertEquals(7, july.integer);
shared void test_august_number() => assertEquals(8, august.integer);
shared void test_september_number() => assertEquals(9, september.integer);
shared void test_october_number() => assertEquals(10, october.integer);
shared void test_november_number() => assertEquals(11, november.integer);
shared void test_december_number() => assertEquals(12, december.integer);

shared void test_january_string() => assertEquals("january", january.string);
shared void test_february_string() => assertEquals("february", february.string);
shared void test_march_string() => assertEquals("march", march.string);
shared void test_april_string() => assertEquals("april", april.string);
shared void test_may_string() => assertEquals("may", may.string);
shared void test_june_string() => assertEquals("june", june.string);
shared void test_july_string() => assertEquals("july", july.string);
shared void test_august_string() => assertEquals("august", august.string);
shared void test_september_string() => assertEquals("september", september.string);
shared void test_october_string() => assertEquals("october", october.string);
shared void test_november_string() => assertEquals("november", november.string);
shared void test_december_string() => assertEquals("december", december.string);

shared void test_january_predecessor() => assertEquals(december, january.predecessor);
shared void test_february_predecessor() => assertEquals(january, february.predecessor);
shared void test_march_predecessor() => assertEquals(february, march.predecessor);
shared void test_april_predecessor() => assertEquals(march, april.predecessor);
shared void test_may_predecessor() => assertEquals(april, may.predecessor);
shared void test_june_predecessor() => assertEquals(may, june.predecessor);
shared void test_july_predecessor() => assertEquals(june, july.predecessor);
shared void test_august_predecessor() => assertEquals(july, august.predecessor);
shared void test_september_predecessor() => assertEquals(august, september.predecessor);
shared void test_october_predecessor() => assertEquals(september, october.predecessor);
shared void test_november_predecessor() => assertEquals(october, november.predecessor);
shared void test_december_predecessor() => assertEquals(november, december.predecessor);

shared void test_january_successor() => assertEquals(february, january.successor);
shared void test_february_successor() => assertEquals(march, february.successor);
shared void test_march_successor() => assertEquals(april, march.successor);
shared void test_april_successor() => assertEquals(may, april.successor);
shared void test_may_successor() => assertEquals(june, may.successor);
shared void test_june_successor() => assertEquals(july, june.successor);
shared void test_july_successor() => assertEquals(august, july.successor);
shared void test_august_successor() => assertEquals(september, august.successor);
shared void test_september_successor() => assertEquals(october, september.successor);
shared void test_october_successor() => assertEquals(november, october.successor);
shared void test_november_successor() => assertEquals(december, november.successor);
shared void test_december_successor() => assertEquals(january, december.successor);

shared void test_monthOf_1() => assertEquals(january, monthOf(1));
shared void test_monthOf_2() => assertEquals(february, monthOf(2));
shared void test_monthOf_3() => assertEquals(march, monthOf(3));
shared void test_monthOf_4() => assertEquals(april, monthOf(4));
shared void test_monthOf_5() => assertEquals(may, monthOf(5));
shared void test_monthOf_6() => assertEquals(june, monthOf(6));
shared void test_monthOf_7() => assertEquals(july, monthOf(7));
shared void test_monthOf_8() => assertEquals(august, monthOf(8));
shared void test_monthOf_9() => assertEquals(september, monthOf(9));
shared void test_monthOf_10() => assertEquals(october, monthOf(10));
shared void test_monthOf_11() => assertEquals(november, monthOf(11));
shared void test_monthOf_12() => assertEquals(december, monthOf(12));

shared void test_monthOf_january() => assertEquals(january, monthOf(january));
shared void test_monthOf_february() => assertEquals(february, monthOf(february));
shared void test_monthOf_march() => assertEquals(march, monthOf(march));
shared void test_monthOf_april() => assertEquals(april, monthOf(april));
shared void test_monthOf_may() => assertEquals(may, monthOf(may));
shared void test_monthOf_june() => assertEquals(june, monthOf(june));
shared void test_monthOf_july() => assertEquals(july, monthOf(july));
shared void test_monthOf_august() => assertEquals(august, monthOf(august));
shared void test_monthOf_september() => assertEquals(september, monthOf(september));
shared void test_monthOf_october() => assertEquals(october, monthOf(october));
shared void test_monthOf_november() => assertEquals(november, monthOf(november));
shared void test_monthOf_december() => assertEquals(december, monthOf(december));

shared void test_january_numberOfDays() => assertEquals(31, january.numberOfDays());
shared void test_february_numberOfDays() => assertEquals(28, february.numberOfDays());
shared void test_march_numberOfDays() => assertEquals(31, march.numberOfDays());
shared void test_april_numberOfDays() => assertEquals(30, april.numberOfDays());
shared void test_may_numberOfDays() => assertEquals(31, may.numberOfDays());
shared void test_june_numberOfDays() => assertEquals(30, june.numberOfDays());
shared void test_july_numberOfDays() => assertEquals(31, july.numberOfDays());
shared void test_august_numberOfDays() => assertEquals(31, august.numberOfDays());
shared void test_september_numberOfDays() => assertEquals(30, september.numberOfDays());
shared void test_october_numberOfDays() => assertEquals(31, october.numberOfDays());
shared void test_november_numberOfDays() => assertEquals(30, november.numberOfDays());
shared void test_december_numberOfDays() => assertEquals(31, december.numberOfDays());

shared void test_january_numberOfDays_leapYear() => assertEquals(31, january.numberOfDays(leapYear));
shared void test_february_numberOfDays_leapYear() => assertEquals(29, february.numberOfDays(leapYear));
shared void test_march_numberOfDays_leapYear() => assertEquals(31, march.numberOfDays(leapYear));
shared void test_april_numberOfDays_leapYear() => assertEquals(30, april.numberOfDays(leapYear));
shared void test_may_numberOfDays_leapYear() => assertEquals(31, may.numberOfDays(leapYear));
shared void test_june_numberOfDays_leapYear() => assertEquals(30, june.numberOfDays(leapYear));
shared void test_july_numberOfDays_leapYear() => assertEquals(31, july.numberOfDays(leapYear));
shared void test_august_numberOfDays_leapYear() => assertEquals(31, august.numberOfDays(leapYear));
shared void test_september_numberOfDays_leapYear() => assertEquals(30, september.numberOfDays(leapYear));
shared void test_october_numberOfDays_leapYear() => assertEquals(31, october.numberOfDays(leapYear));
shared void test_november_numberOfDays_leapYear() => assertEquals(30, november.numberOfDays(leapYear));
shared void test_december_numberOfDays_leapYear() => assertEquals(31, december.numberOfDays(leapYear));

shared void test_january_firstDayOfYear() => assertEquals(1, january.fisrtDayOfYear());
shared void test_february_firstDayOfYear() => assertEquals(32, february.fisrtDayOfYear());
shared void test_march_firstDayOfYear() => assertEquals(60, march.fisrtDayOfYear());
shared void test_april_firstDayOfYear() => assertEquals(91, april.fisrtDayOfYear());
shared void test_may_firstDayOfYear() => assertEquals(121, may.fisrtDayOfYear());
shared void test_june_firstDayOfYear() => assertEquals(152, june.fisrtDayOfYear());
shared void test_july_firstDayOfYear() => assertEquals(182, july.fisrtDayOfYear());
shared void test_august_firstDayOfYear() => assertEquals(213, august.fisrtDayOfYear());
shared void test_september_firstDayOfYear() => assertEquals(244, september.fisrtDayOfYear());
shared void test_october_firstDayOfYear() => assertEquals(274, october.fisrtDayOfYear());
shared void test_november_firstDayOfYear() => assertEquals(305, november.fisrtDayOfYear());
shared void test_december_firstDayOfYear() => assertEquals(335, december.fisrtDayOfYear());

shared void test_january_firstDayOfYear_leapYear() => assertEquals(1, january.fisrtDayOfYear(leapYear));
shared void test_february_firstDayOfYear_leapYear() => assertEquals(32, february.fisrtDayOfYear(leapYear));
shared void test_march_firstDayOfYear_leapYear() => assertEquals(61, march.fisrtDayOfYear(leapYear));
shared void test_april_firstDayOfYear_leapYear() => assertEquals(92, april.fisrtDayOfYear(leapYear));
shared void test_may_firstDayOfYear_leapYear() => assertEquals(122, may.fisrtDayOfYear(leapYear));
shared void test_june_firstDayOfYear_leapYear() => assertEquals(153, june.fisrtDayOfYear(leapYear));
shared void test_july_firstDayOfYear_leapYear() => assertEquals(183, july.fisrtDayOfYear(leapYear));
shared void test_august_firstDayOfYear_leapYear() => assertEquals(214, august.fisrtDayOfYear(leapYear));
shared void test_september_firstDayOfYear_leapYear() => assertEquals(245, september.fisrtDayOfYear(leapYear));
shared void test_october_firstDayOfYear_leapYear() => assertEquals(275, october.fisrtDayOfYear(leapYear));
shared void test_november_firstDayOfYear_leapYear() => assertEquals(306, november.fisrtDayOfYear(leapYear));
shared void test_december_firstDayOfYear_leapYear() => assertEquals(336, december.fisrtDayOfYear(leapYear));



