class switch_test extends uvm_test;
    `uvm_component_utils(switch_test)

    virtual switch_if _vif;

    function new(string name="switch_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    //   env = counter_env::type_id::create("env",this);   
        if (!uvm_config_db #(virtual switch_if)::get(this, "", "_vif", _vif))
            `uvm_fatal("INTERFACE", "No virtual interface found")
    endfunction : build_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        _vif.rstn = 1;
        _vif.vld = 1;
        @(posedge _vif.clk);
        @(negedge _vif.clk);

        repeat (5) begin
            _vif.addr = $random;
            _vif.data = $random;
            @(posedge _vif.clk);
            #2
            $display("addr_a=%0b data_a=%0b addr_b=%0b data_b=%0b", _vif.addr_a, _vif.data_a, _vif.addr_b, _vif.data_b);
        end

        phase.drop_objection(this);
    endtask

endclass