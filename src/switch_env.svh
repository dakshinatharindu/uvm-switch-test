class switch_env extends uvm_env;

    `uvm_component_utils(switch_env);

    switch_agent agnt;

    function new(string name="", uvm_component parent);
      super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agnt = switch_agent::type_id::create("agnt", this);
    endfunction : build_phase

endclass