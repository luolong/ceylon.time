import ceylon.language { Integer }
import ceylon.math.float { log10 }

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
