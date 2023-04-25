class switch_req extends uvm_sequence_item;

    `uvm_object_utils(switch_req)

    rand logic rstn;
    rand logic vld;
    rand logic [ADDR_WIDTH-1:0] addr;
    rand logic [DATA_WIDTH-1:0] data;
    rand logic [DATA_WIDTH-1:0] data_a;
    rand logic [ADDR_WIDTH-1:0] addr_b;
    rand logic [DATA_WIDTH-1:0] data_b;
    rand logic [ADDR_WIDTH-1:0] addr_a;

    constraint rstn_range {rstn dist { 0 := 3, 1 := 7};}
    constraint vld_range {vld dist { 0 := 3, 1 := 7};}

    function new(string name = "switch_req");
        super.new(name);
    endfunction

    virtual function string convert2str();
        return $sformatf("rstn=%h, vld=%h, addr=%h, data=%h, addr_a=%h, data_a=%h, addr_b=%h, data_b=%h", rstn, vld, addr, data, addr_a, data_a, addr_b, data_b);
    endfunction
endclass