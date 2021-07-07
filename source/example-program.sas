filename mwdata url 'https://raw.githubusercontent.com/mooreaw-boisestate/example-data/main/data/midwest.csv';
/* test comment */
PROC IMPORT datafile = mwdata
            dbms = csv
            out = midwest
            replace;
     delimiter = ',';
RUN;
/*This is a data step!!!*/
DATA mw2;
     set midwest;
     keep PID county state poptotal popdensity percbelowpoverty percadultpoverty inmetro;
     where state <> 'OH';
RUN;
