module tst_CMOSsw1();
  reg in,con; wire out;
  reg [10:0] results;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial begin
    #50 // Delay until switch has toggled once
    $display($sformatf("0: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("1: %b",results[0] == cmsw.OUT2));
  end
  initial begin
    #200 // Delay until switch has toggled once
    #50 // Delay until switch has toggled once
    $display($sformatf("2: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("3: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("4: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("5: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("6: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("7: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("8: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("9: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("10: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("11: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("12: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("13: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("14: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("15: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("16: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("17: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("18: %b",results[10] == cmsw.OUT1));
    #50 // Delay until switch has toggled once
    $display($sformatf("19: %b",results[0] == cmsw.OUT2));
    #50 // Delay until switch has toggled once
    $display($sformatf("20: %b, 21: %b, 22: %b, 23: %b, 24: %b, 25: %b, 26: %b, 27