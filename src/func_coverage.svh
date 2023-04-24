class func_coverage extends uvm_subscriber #(switch_req);

    `uvm_component_utils(func_coverage)

    logic rstn;
    
    covergroup reset;
        coverpoint rstn;
    endgroup

    function new(string name = "func_coverage", uvm_component parent);
        super.new(name, parent);
        reset = new();
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    

    function void write(switch_req t);
        `uvm_info("COVER", $sformatf("Got \t\t%s", t.convert2str()), UVM_MEDIUM)
        rstn = t.rstn;
        reset.sample();
    endfunction
endclass