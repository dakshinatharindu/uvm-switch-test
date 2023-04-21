module switch_wrapper #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 16,
    parameter ADDR_DIV = 8'h3F
) (
    switch_if.switch_mp i
);

switch #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH), .ADDR_DIV(ADDR_DIV)) dut(
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