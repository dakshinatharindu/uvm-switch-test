class switch_res extends uvm_sequence_item;

    `uvm_object_utils(switch_res)

    rand logic [DATA_WIDTH-1:0] data_a;
    rand logic [ADDR_WIDTH-1:0] addr_b;
    rand logic [DATA_WIDTH-1:0] data_b;
    rand logic [ADDR_WIDTH-1:0] addr_a;

    function new(string name = "switch_req");
        super.new(name);
    endfunction

    virtual function string convert2str();
        return $sformatf("addr_a = %b, data_a = %b, addr_b = %b, data_b = %b", addr_a, data_a, addr_b, data_b);
    endfunction
endclass