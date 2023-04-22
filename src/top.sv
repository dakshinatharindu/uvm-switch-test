import uvm_pkg::*;
import switch_pkg::*;


module top;

   switch_if sw_if();
   switch_wrapper dut(sw_if.switch_mp);
   
   initial begin
    uvm_config_db #(virtual switch_if)::set(null, "uvm_test_top", "_vif", sw_if);
    
    run_test();
      
   end   
      
endmodule // top