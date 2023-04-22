class switch_req extends uvm_sequence_item;

    `uvm_object_utils(switch_req)

    rand logic [ADDR_WIDTH-1:0] addr;
    rand logic [DATA_WIDTH-1:0] data;

    function new(string name = "switch_req");
        super.new(name);
    endfunction

    virtual function string convert2str();
        return $sformatf("addr = %b, data = %b", addr, data);
    endfunction
endclass