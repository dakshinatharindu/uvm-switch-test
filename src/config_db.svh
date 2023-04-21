class config_db extends uvm_object;

    `uvm_object_utils(config_db)

    virtual switch_if sw_if;

    function new(string name = "");
        super.new(name);
    endfunction
endclass