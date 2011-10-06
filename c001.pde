/*
  clock 001
  2011/10/04T21:16:07
  patrick dwyer
  
  See http://patricknevindwyer.github.com/clocks for more info.
  
*/
PFont clockFont;

String bases[] = {"one", "two", "three", "four", "five", "six", "seven", "eight",
                "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
                "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
String tens[] = {"ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy",
               "eighty", "ninety"};
               
void setup() {

   clockFont = loadFont("Helvetica-48.vlw"); 
   size(300,130);
   smooth(); 
}

void draw() {
 
   background(0, 0.01);
   int h = hour();
   int m = minute();
   int s = second();
   int ms = (int)(System.currentTimeMillis() % 1000);
   
   textFont(clockFont, 48);
   text(numToText(h), 5, 40);
   
   textFont(clockFont, 36);
   text(numToText(m), 5, 75);
   
   textFont(clockFont, 24);
   text(numToText(s), 5, 102);
   
   textFont(clockFont, 14);
   text(numToText(ms), 5, 121);
}

String numToText(int i) {
 
   int hundreds = i / 100;
   int base = i % 100;
   
   String time = "";
   
   if (base == 0) {
      // no-op
   } else if (base < 20) {
      time = bases[base - 1];
   }
   else {
      time = tens[base / 10 - 1];
      
      if (base % 10 != 0) {
         time = time + " " + bases[base % 10 - 1];
      }
   }
  
   if (hundreds > 0) {
      String prefix = bases[hundreds - 1] + " hundred";
      
      if (time.equals("")) {
          time = prefix;
      }
      else {
          time = prefix + " and " + time;
      }
   } 
   
   if ( (hundreds == 0) && (base == 0) ) {
      time = "zero"; 
   }
   
   return time;
}
