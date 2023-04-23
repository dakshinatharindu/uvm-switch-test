class driver extends uvm_driver #(switch_req);

    `uvm_component_utils(driver)

    config_db db;
    virtual switch_if sw_if;

    function new(string name = "driver", uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db #(config_db)::get(this, "", "db", db))
            `uvm_fatal("DRIVER", "No config_db found")
        sw_if = db.sw_if;

    endfunction : build_phase

    task run_phase(uvm_phase phase);
        forever begin
            switch_req req_tx;
            @(negedge sw_if.clk);
            seq_item_port.get(req_tx);
            `uvm_info("DRIVER", $sformatf("Driver got %s", req_tx.convert2str()), UVM_HIGH)
            sw_if.rstn = req_tx.rstn;
            sw_if.vld = req_tx.vld;
            sw_if.addr = req_tx.addr;
            sw_if.data = req_tx.data;
            
            @(posedge sw_if.clk);
            #2;
            req_tx.addr_a = sw_if.addr_a;
            req_tx.data_a = sw_if.data_a;
            req_tx.addr_b = sw_if.addr_b;
            req_tx.data_b = sw_if.data_b;

            seq_item_port.put(req_tx);

        end
    endtask
endclass