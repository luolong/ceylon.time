
import ceylon.math.whole { Whole, one, zero, wholeNumber }
import ceylon.time { now, Instant, date }

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
    
    value duration = start.durationTo(now());
    print("Calculated 40000 digits of pi in ``duration.period.normalized()``");
    
    value startDate = start.date();
    value startTime = start.time();
    
    print("Pi calculation started on ``startDate`` at ``startTime`` (UTC)");
    
    print("Minimum date is ``date(-24660873952897, 12, 25)``");
    print("Maximum date is ``date(24660873952898, 1, 7)``");
    print("Minimum Instant is ``Instant(-9007199254740991).dateTime()``");
    print("Maximum Instant is ``Instant(9007199254740991).dateTime()``");
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
