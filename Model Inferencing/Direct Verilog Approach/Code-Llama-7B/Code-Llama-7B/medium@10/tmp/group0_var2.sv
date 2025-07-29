module ha_10(s,ca,a,b);
  input a,b; output s,ca;
  specify
    specparam dl1 = 1;
    specparam dl2 = dl1 + 1;
    // Assign path delays using specparams
    if (`a in {s[6:0],d[2:0]})
      (a, b *> s) = dl1;