import ceylon.math.float { cfloor = floor }

doc "Utility class for common functions for calendar related calculations"
shared object calendarMath {

    doc "Returns the largest integer less than or equal to _x_"
    shared Integer floor( Float x ) => cfloor( x ).integer;

    doc "Returns floored division of the two integers"
    shared Integer floorDiv(Integer x, Integer y) => floor(x.float / y.float);

    doc "Returns nearest integer to x"
    shared Integer round( Float f ) => floor( f + 0.5);

    doc "Modulus (remainder) function."
    shared Integer mod(Integer x, Integer y) {
        Float fx = x.float;
        Float fy = y.float;
        return (fx - fy * floor(fx / fy)).integer;
    }

    doc "Returns an _adjusted remainder_ of the two integers."
    shared Integer amod(Integer x, Integer y){
        value amod = mod(x, y);
        if (amod == 0) {
            return y;
        }
        return amod;
    }

    doc "Returns the floor modulus.

         - This returns `0` for  `floorMod(0, 4)`.
         - This returns `-1` for `floorMod(-1, 4)`.
         - This returns `-2` for `floorMod(-2, 4)`.
         - This returns `-3` for `floorMod(-3, 4)`.
         - This returns `-0` for `floorMod(-4, 4)`.
         "
    shared Integer floorMod(a, b) {
        doc "the dividend"
        Integer a;
        doc "the divisor"
        Integer b;

        return (((a % b) + b) % b);
    }

}