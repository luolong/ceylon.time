shared interface ReadableDateTime
       satisfies ReadableDate & ReadableTime {

    doc "Returns milliseconds elapsed since january 1st 1970 UTC"
    shared formal Integer millisFromEpoch;

}