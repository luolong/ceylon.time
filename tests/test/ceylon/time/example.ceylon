
import ceylon.math.whole { Whole, one, zero, wholeNumber }
import ceylon.time { now, Instant }

doc "An example program using ceylon.time"
void run(){
    
    print("Getting current timestamp");
    Instant start = now();
    
    print("Spending some time calculating pi...")
    value pi = Pi();
    for (n in 0..4000) {
        process.write( pi.next().string );
        if (n == 0){
            process.write(".");
        }
    }
    print("");
    
    print("Calculating duration of the computation...");
    value duration = start.durationTo(now());
    
    print("Calculated 20000 digits of pi in ``duration.period.normalized()``");
}

Whole two = wholeNumber(2);
Whole three = wholeNumber(3);
Whole four = wholeNumber(4);
Whole seven = wholeNumber(7);
Whole ten = wholeNumber(10);

doc "Pi digits calculator"
class Pi() satisfies Iterator<Whole>{
  variable Whole q = one;
  variable Whole r = zero;
  variable Whole t = one;
  variable Whole k = one;
  variable Whole n = three;
  variable Whole l = three;
  
  shared actual Whole|Finished next() {
      while ((four * q + r - t) >= n * t) {
          value nr = (two * q + r) * l;
          value nn = ((q * seven * k) + two + r * l) / (t * l);
          q *= k;
          t *= l;
          l += two;
          k += one;
          n = nn;
          r = nr;
      }
      
      value nout = n;
      value nr = ten * (r - n * t);
      n = ten * (three * q + r) / t - ten * n; 
      q *= ten;
      r = nr;
      return nout;
  }
  
}
