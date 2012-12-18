shared class AssertionFailed(String message) extends Exception(message, null) {}

doc "Fails the test."
shared void fail(String message = "Failed") {
    throw AssertionFailed(message);
}

doc "Fails the test if the assertion is false"
shared void assertTrue(Boolean assertion, String? message=null)  {
    if (!assertion) {
        fail("" (message else "assertion failed")
             ". Expected true, got " assertion.string "");
    }
}

doc "Fails the test if the assertion is true"
shared void assertFalse(Boolean assertion, String? message=null) {
    if (assertion) {
        fail("" (message else "assertion failed")
             ". Expected false, got " assertion.string "");
    }
}

String str(Object? obj) {
    if (is String obj){
        return "\"" obj "\"";
    }
    if (exists obj) {
        return "<" obj.string ">";
    }
    return "null";
}

Boolean nullSafeEquals(Object? expected, Object? got) {
    if (exists expected, exists got) {
        return expected == got;
    }
    return exists got == exists expected;
}

doc "Fails the test if the two objects are not equal"
shared void assertEquals(Object? expected, Object? got, String? message=null,
        Boolean compare(Object? expected, Object? got) = nullSafeEquals) {
    if (compare(expected,got)) {
        return;
    }

    fail("" (message else "assertion failed:")
         " expected:" str(expected) ", but got:" str(got) "");
}

doc "Fails the test if the two objects are not equal"
shared void assertNotEquals(Object? expected, Object? got, String? message=null,
        Boolean compare(Object? expected, Object? got) = nullSafeEquals) {
    if (compare(expected,got)) {
        fail("" (message else "assertion failed")
             ": expected not equal but got " str(got) "");
    }
}

Boolean nullSafeSame(Object? expected, Object? got) {
    if (is Identifiable expected, is Identifiable got){
        return expected === got;
    }
    return false;
}

doc "Fails the test if the two objects are not same"
shared void assertSame(Object? expected, Object? got, String? message=null,
        Boolean same(Object? expected, Object? got) = nullSafeSame) {
    if ( same(expected, got) ) {
        return;
    }

    fail("" (message else "assertion failed:")
         " expected same:" str(expected) " was not:" str(got) "");
}

doc "Fails if two objects are the same."
shared void assertNotSame(Object? expected, Object? got, String? message=null,
        Boolean same(Object? expected, Object? got) = nullSafeSame){
    if ( same(expected, got) ){
        fail("" (message else "assertion failed:") " expected not same");
    }
}

doc "Fails the test if the given result is not null"
shared void assertNull(Object? got, String? message = null) {
    if (exists got) {
        fail("" (message else "assertion failed:") " expected null but got " got "");
    }
}

doc "Fails the test if the given result is null"
shared void assertNotNull(Object? got, String? message = null) {
    if (! got exists) {
        fail("" (message else "assertion failed:") " expected not null but got null");
    }
}
