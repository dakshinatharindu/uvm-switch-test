module switch_wrapper (
    switch_if.switch_mp i
);

switch #(
    .ADDR_WIDTH(switch_pkg::ADDR_WIDTH), 
    .DATA_WIDTH(switch_pkg::DATA_WIDTH), 
    .ADDR_DIV(switch_pkg::ADDR_DIV)) dut(
    .clk(i.clk),
    .rstn(i.rstn),
    .vld(i.vld),
    .addr(i.addr),
    .data(i.data),
    .addr_a(i.addr_a),
    .data_a(i.data_a),
    .addr_b(i.addr_b),
    .data_b(i.data_b)
   );
    
endmodule