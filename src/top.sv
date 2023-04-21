import uvm_pkg::*;
import switch_pkg::*;

module top;

   switch_if _if();
   switch_wrapper dut(_if.switch_mp);
   
   initial begin
    uvm_config_db #(virtual switch_if)::set(null, "uvm_test_top", "_vif", _if);
    
    run_test();
      
   end   
      
endmodule // top