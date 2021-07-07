PROC SORT data = mw2 out = mw2_sorted;
     by state inmetro;
RUN;

/* Add formats for state and the metro indicator */
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
