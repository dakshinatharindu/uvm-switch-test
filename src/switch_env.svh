class switch_env extends uvm_env;

    `uvm_component_utils(switch_env);

    switch_agent agnt;
    scoreboard score;

    function new(string name="", uvm_component parent);
      super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agnt = switch_agent::type_id::create("agnt", this);
        score = scoreboard::type_id::create("score", this);
    endfunction : build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agnt.mon.mon_analysis_port.connect(score.score_analysis_imp);
    endfunction : connect_phase

endclass