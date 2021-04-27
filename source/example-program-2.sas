PROC SORT data = mw2 out = mw2_sorted;
     by state inmetro;
RUN;

PROC MEANS data = mw2_sorted;
     var percadultpoverty percbelowpoverty;
     by state inmetro;
RUN;
