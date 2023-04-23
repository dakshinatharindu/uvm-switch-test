class switch_test extends uvm_test;

    `uvm_component_utils(switch_test)

    config_db db;
    switch_env env;
    test_seq_a seq_a;
    test_seq_b seq_b;

    function new(string name="switch_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = switch_env::type_id::create("env",this);
        seq_a = test_seq_a::type_id::create("seq_a");
        seq_b = test_seq_b::type_id::create("seq_b");
        db = new(); 
        if (!uvm_config_db #(virtual switch_if)::get(this, "", "sw_if", db.sw_if))
            `uvm_fatal("TEST", "No virtual interface found")
        uvm_config_db #(config_db)::set(this, "*", "db", db);
    endfunction : build_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        env.agnt.seqr.set_arbitration(UVM_SEQ_ARB_RANDOM);
    endfunction : end_of_elaboration_phase

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        assert(seq_a.randomize());
        assert(seq_b.randomize());
        fork
            seq_a.start(env.agnt.seqr);
            seq_b.start(env.agnt.seqr);
        join
        phase.drop_objection(this);
    endtask

endclass