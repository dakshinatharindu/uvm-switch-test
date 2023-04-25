class scoreboard extends uvm_scoreboard;

    `uvm_component_utils(scoreboard)

    uvm_analysis_imp #(switch_req, scoreboard)  score_analysis_imp;

    function new(string name = "scoreboard", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        score_analysis_imp = new("score_analysis_imp", this);
    endfunction : build_phase

    function void write(switch_req req_tx);
        `uvm_info("SCORE", $sformatf("Got \t\t\t%s", req_tx.convert2str()), UVM_MEDIUM)
        if (!req_tx.rstn) begin 
            if (!{req_tx.addr_a, req_tx.addr_b, req_tx.data_a, req_tx.data_b})
                `uvm_info("SCORE", "Passed rstn", UVM_HIGH)
            else
                `uvm_error("SCORE", "Failed rstn")
        end else begin
            if (req_tx.vld) begin 
                if (req_tx.addr >= 0 && req_tx.addr <= ADDR_DIV) begin
                    if (req_tx.addr_a === req_tx.addr && req_tx.data_a === req_tx.data && !{req_tx.addr_b, req_tx.data_b})
                        `uvm_info("SCORE", "Passed DIV A", UVM_HIGH)
                    else
                        `uvm_error("SCORE", "Failed DIV A")
                end else begin
                    if (req_tx.addr_b === req_tx.addr && req_tx.data_b === req_tx.data && !{req_tx.addr_a, req_tx.data_a})
                        `uvm_info("SCORE", "Passed DIV B", UVM_HIGH)
                    else
                        `uvm_error("SCORE", "Failed DIV B")
                end
            end
        end
    endfunction
endclass