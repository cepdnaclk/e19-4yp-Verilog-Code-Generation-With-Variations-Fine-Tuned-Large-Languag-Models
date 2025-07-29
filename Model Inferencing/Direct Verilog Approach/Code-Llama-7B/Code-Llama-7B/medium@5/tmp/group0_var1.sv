module ha_8(s,ca,a,b,in); // Half Adder with specparam path delays
  input a,b,in; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    if (in) (a, b *> s) = dl1;
    else (a, b *> s) = dl1;
    if (in) (a, b *> ca) = dl2;
    else (a, b *> ca) = dl2;