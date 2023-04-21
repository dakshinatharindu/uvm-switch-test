import uvm_pkg::*;
import switch_pkg::*;

module top;

   switch_if _if();
   switch_wrapper dut(_if.switch_mp);

   
   initial begin
    _if.rstn = 1;
    _if.vld = 1;

    @(posedge _if.clk);
    @(negedge _if.clk);


    repeat (5) begin
        _if.addr = $random;
        _if.data = $random;
        @(posedge _if.clk);
        #2
        $display("addr_a=%0b data_a=%0b addr_b=%0b data_b=%0b", _if.addr_a, _if.data_a, _if.addr_b, _if.data_b);
    end
    $finish;
      
   end   
      
endmodule // top