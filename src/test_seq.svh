class test_seq extends uvm_sequence #(switch_req);

    `uvm_object_utils(test_seq)

    int n_loops = 20;

    function new(string name = "test_seq");
        super.new(name);
    endfunction

    virtual task body();
        repeat (n_loops) begin
            switch_req req_tx = switch_req::type_id::create("req_tx");
            start_item(req_tx);
            assert (req_tx.randomize());
            `uvm_info("SEQ", $sformatf("Generated req: %s", req_tx.convert2str()), UVM_HIGH)
            finish_item(req_tx);
        end
    endtask
endclass