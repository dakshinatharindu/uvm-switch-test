class switch_agent extends uvm_agent;

    `uvm_component_utils(switch_agent)

    driver drv;
    monitor mon;
    uvm_sequencer #(switch_req) seqr;

    function new(string name = "switch_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv = driver::type_id::create("drv", this);
        mon = monitor::type_id::create("mon", this);
        seqr = uvm_sequencer #(switch_req)::type_id::create("seqr", this);
    endfunction : build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction : connect_phase

endclass