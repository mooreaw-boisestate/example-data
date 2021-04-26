PROC IMPORT datafile = 'C:/Users/andrewmoore1/Documents/example-data/midwest.csv' dbms = csv out = midwest replace;
     delimiter = ',';
RUN;

DATA mw2;
     set midwest;
     keep PID county state poptotal popdensity percbelowpoverty percadultpoverty inmetro;
     where state <> 'WI';
RUN;
