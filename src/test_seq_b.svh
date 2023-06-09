class test_seq_b extends uvm_sequence #(switch_req);

    `uvm_object_utils(test_seq_b)

    rand int n_loops;
    constraint n_loops_constr {n_loops inside {[5000:6000]};}

    function new(string name = "test_seq_b");
        super.new(name);
    endfunction

    virtual task body();
        repeat(n_loops) begin 
            switch_req req_tx = switch_req::type_id::create("req_tx");
            start_item(req_tx);
            assert (req_tx.randomize() with {addr >= ADDR_DIV;});
            `uvm_info("SEQ", $sformatf("Sent:\t\t%s", req_tx.convert2str()), UVM_MEDIUM)
            finish_item(req_tx);
            get_response(req_tx);
            `uvm_info("SEQ", $sformatf("Got:\t\t%s", req_tx.convert2str()), UVM_HIGH)
        end
    endtask
endclass