import ceylon.time.base { ms=milliseconds }
import ceylon.language { Integer }
import ceylon.math.float { log10 }
import ceylon.time { time, Time }

doc "return padded value"
shared String leftPad(Integer number, String padding = "00"){
    if (number == 0){
        return padding;
    }

    value digits = log10( number.magnitude.float ).wholePart.integer + 1;
    if (digits < padding.size) {
        value padded = padding.plus( number.string );
        return padded.segment(
                      padded.size - padding.size,
                      padding.size );
    }

    return number.string;
}

shared Time normalizedTime( Integer hour, Integer minute, Integer second, Integer milli ) {
    Integer newSofd = (hour * ms.perHour
                 + minute * ms.perMinute
                 + second * ms.perSecond 
                 + milli ) % ms.perDay;

    value actualMs = newSofd >= 0 then newSofd else ms.perDay + newSofd; 

    Integer newHour = actualMs / ms.perHour;
        
    variable value rest = actualMs % ms.perHour;
    Integer newMinute = rest / ms.perMinute;
    rest = rest % ms.perMinute;
    Integer newSecond = rest / ms.perSecond;
    return time(newHour, newMinute, newSecond, rest % ms.perSecond);
}
