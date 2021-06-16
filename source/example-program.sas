filename mwdata url 'https://raw.githubusercontent.com/mooreaw-boisestate/example-data/main/data/midwest.csv';

PROC IMPORT datafile = mwdata
            dbms = csv
            out = midwest
            replace;
     delimiter = ',';
RUN;

DATA mw2;
     set midwest;
     keep PID county state poptotal popdensity percbelowpoverty percadultpoverty inmetro;
     where state <> 'WI';
RUN;
