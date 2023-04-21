interface switch_if #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 16,
    parameter ADDR_DIV = 8'h3F);

    logic clk = 0;
    logic rstn = 1;
    logic vld = 1;
    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] data;
    logic [ADDR_WIDTH-1:0] addr_a;
    logic [DATA_WIDTH-1:0] data_a;
    logic [ADDR_WIDTH-1:0] addr_b;
    logic [DATA_WIDTH-1:0] data_b;

    // Switch Modport
    modport switch_mp(
        input clk,
        input rstn,
        input vld,
        input addr,
        input data,
        output addr_a,
        output data_a,
        output addr_b,
        output data_b
    );

    initial begin : clock_gen
      clk = 0;
      forever #10 clk = ~clk;
    end : clock_gen
    
endinterface : switch_if