PROC SORT data = mw2 out = mw2_sorted;
     by state inmetro;
RUN;

/* Editing Comment Test */
PROC FORMAT;
     value $state
           'IL' = 'Illinois'
           'IN' = 'Indiana'
           'MI' = 'Michigan'
           'OH' = 'Ohio'
           'WI' = 'Wisconsin';

     value inmetro
           0 = 'Non-Metro'
           1 = 'In-Metro';
RUN;

/* Get the cross-tabulation, and perform a X^2 test */
PROC FREQ data = mw2_sorted;
     tables state*inmetro / chisq;
     format state $state. inmetro inmetro.;
RUN;

PROC MEANS data = mw2_sorted;
     var percadultpoverty percbelowpoverty inmetro;
     by state;
RUN;

PROC SGPLOT data = mw2_sorted;
     density percadultpoverty / group = state;
RUN;

PROC SGPLOT data = mw2_sorted;
     density perchsd / group = state;
RUN;
