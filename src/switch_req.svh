class switch_req extends uvm_sequence_item;

    `uvm_object_utils(switch_req)

    rand logic rstn;
    rand logic vld;
    rand logic [ADDR_WIDTH-1:0] addr;
    rand logic [DATA_WIDTH-1:0] data;

    constraint rstn_range {rstn dist { 0 := 3, 1 := 7};}
    constraint vld_range {vld dist { 0 := 3, 1 := 7};}

    function new(string name = "switch_req");
        super.new(name);
    endfunction

    virtual function string convert2str();
        return $sformatf("rstn = %b, vld = %b, addr = %b, data = %b", rstn, vld, addr, data);
    endfunction
endclass