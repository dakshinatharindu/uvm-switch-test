class func_coverage extends uvm_subscriber #(switch_req);

    `uvm_component_utils(func_coverage)

    switch_req req;
    
    covergroup switch_input;
        coverpoint req.rstn;
        coverpoint req.vld;
        coverpoint req.addr {
            bins zeros = {0};
            bins ones = {~ADDR_WIDTH'('h0)};
            bins middle = {ADDR_DIV};
            bins div_a = {[0: ADDR_DIV]};
            bins div_b = {[ADDR_DIV+1: ~ADDR_WIDTH'('h0)]};

            bins div_ab = ([0: ADDR_DIV] => [ADDR_DIV+1: ~ADDR_WIDTH'('h0)]);
            bins div_ba = ([ADDR_DIV+1: ~ADDR_WIDTH'('h0)] => [0: ADDR_DIV]);
        }
    endgroup
        
    covergroup switch_cross;
        rstn_leg: coverpoint req.rstn;

        addr_leg: coverpoint req.addr {
            bins zeros = {0};
            bins ones = {~ADDR_WIDTH'('h0)};
            bins middle = {ADDR_DIV};
        }
        basic: cross rstn_leg, addr_leg;
    endgroup

    function new(string name = "func_coverage", uvm_component parent);
        super.new(name, parent);
        switch_input = new();
        switch_cross = new();
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    function void write(switch_req t);
        `uvm_info("COVER", $sformatf("Got \t\t%s", t.convert2str()), UVM_MEDIUM)
        req = t;
        switch_input.sample();
        switch_cross.sample();
    endfunction
endclass