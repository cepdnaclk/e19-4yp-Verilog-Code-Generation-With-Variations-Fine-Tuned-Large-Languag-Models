module ha_8_p(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    if ($isunknown(x[a:b][c:d][e:f][g:h]) || (a<0) || (b<0) || (c<0) || (d<0) || (e<0) || (f<0) || (g<0) || (h<0))
      (a, b *> s) = dl1;
      (a, b *> ca) = dl2;
    else
      (a[b][c][d][e] : a[b][c][d][f] : a[b][c