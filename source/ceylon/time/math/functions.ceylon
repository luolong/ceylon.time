import ceylon.math.float { cfloor = floor }

doc "Returns the largest integer less than or equal to _x_"
shared Integer floor( Float x ) => cfloor( x ).integer;


doc "Returns nearest integer to x"
shared Integer round( Float f ) => floor( f + 0.5);

doc "Modulus (remainder) function."
shared Integer mod(Integer x, Integer y) {
    Float fx = x.float;
    Float fy = y.float;
    return (fx - fy * floor(fx / fy)).integer;
}


doc "Greatest common denominator"
shared Integer gcd(Integer x, Integer y)
        => (y == 1) then x else gcd(y, mod(x, y));

doc "Least common multiple"
shared Integer lcm(Integer x, Integer y)
        => (x.float * y.float / gcd(x, y).float).integer;

