class test_seq_a extends uvm_sequence #(switch_req);

    `uvm_object_utils(test_seq_a)

    rand int n_loops;
    constraint how_many {n_loops inside {[20:30]};}

    function new(string name = "test_seq_a");
        super.new(name);
    endfunction

    virtual task body();
        repeat(n_loops) begin 
            switch_req req_tx = switch_req::type_id::create("req_tx");
            start_item(req_tx);
            assert (req_tx.randomize() with {addr <= ADDR_DIV;});
            `uvm_info("SEQ", $sformatf("Generated req:\t%s", req_tx.convert2str()), UVM_MEDIUM)
            finish_item(req_tx);
            get_response(req_tx);
            `uvm_info("SEQ", $sformatf("Got res:\t%s", req_tx.convert2str()), UVM_MEDIUM)
        end
    endtask
endclass