class switch_test extends uvm_test;

    `uvm_component_utils(switch_test)

    config_db db;   // database to pass objects
    switch_env env;

    function new(string name="switch_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = switch_env::type_id::create("env",this);  
        db = new(); 
        if (!uvm_config_db #(virtual switch_if)::get(this, "", "_vif", db.sw_if))
            `uvm_fatal("INTERFACE", "No virtual interface found")
        uvm_config_db #(config_db)::set(this, "*", "db", db);
    endfunction : build_phase

    function void end_of_elaboration();
        super.end_of_elaboration();
        env.set_report_verbosity_level_hier(UVM_DEBUG);
    endfunction : end_of_elaboration

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        db.sw_if.rstn = 1;
        db.sw_if.vld = 1;
        @(posedge db.sw_if.clk);
        @(negedge db.sw_if.clk);

        repeat (20) begin
            db.sw_if.addr = $random;
            db.sw_if.data = $random;
            @(posedge db.sw_if.clk);
            #2
            $display("addr_a=%0b data_a=%0b addr_b=%0b data_b=%0b", db.sw_if.addr_a, db.sw_if.data_a, db.sw_if.addr_b, db.sw_if.data_b);
        end

        phase.drop_objection(this);
    endtask

endclass