class top_seq extends uvm_sequence #(switch_req);

    `uvm_object_utils(top_seq)

    test_seq_a seq_a;
    // test_seq_b seq_b;
    uvm_sequencer #(switch_req) seqr;
    
    function new(string name = "top_seq");
        super.new(name);
    endfunction

    function void build_phase(uvm_phase phase);
        seq_a = test_seq_a::type_id::create("seq_a");
        // seq_b = test_seq_b::type_id::create("seq_b");
    endfunction: build_phase

    virtual task body();
        
        seq_a.start(seqr);
            // seq_b.start(seqr);
        
    endtask
endclass