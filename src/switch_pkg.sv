package switch_pkg;
    // macros
    parameter ADDR_WIDTH  = 8;
    parameter DATA_WIDTH = 16;
    parameter ADDR_DIV = 8'h3F;

    // uvm
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // uvm_object
    // `include "config_db.svh"

    // uvm_transactions
    `include "switch_req.svh"
    // `include "switch_res.svh"
    `include "test_seq.svh"
    `include "driver.svh"

    // uvm_agents
    `include "switch_agent.svh"

    // uvm_environment
    `include "switch_env.svh"

    // uvm_tests
    `include "switch_test.svh"
    
endpackage 