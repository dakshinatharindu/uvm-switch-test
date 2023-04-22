class switch_test extends uvm_test;

    `uvm_component_utils(switch_test)

    // config_db db;   // database to pass objects
    switch_env env;
    test_seq seq;

    function new(string name="switch_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = switch_env::type_id::create("env",this);
        seq = test_seq::type_id::create("seq");

        // db = new(); 
        // if (!uvm_config_db #(virtual switch_if)::get(this, "", "_vif", sw_if))
        //     `uvm_fatal("INTERFACE", "No virtual interface found")
        // uvm_config_db #(config_db)::set(this, "*", "db", db);
    endfunction : build_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq.start(env.agnt.seqr);
        phase.drop_objection(this);
    endtask

endclass