`ifndef BASE_SEQ_SLAVE_SV
`define BASE_SEQ_SLAVE_SV

class base_seq_slave extends uvm_sequence#(seq_item_slave);

   `uvm_object_utils(base_seq_slave)
   `uvm_declare_p_sequencer(sequencer_slave)

   function new(string name = "base_seq_slave");
      super.new(name);
   endfunction

   // objections are raised in pre_body
   virtual task pre_body();
      uvm_phase phase = get_starting_phase();
      if (phase != null)
        phase.raise_objection(this, {"Running sequence '", get_full_name(), "'"});
      //uvm_test_done.set_drain_time(this, 200us);
   endtask : pre_body

   // objections are dropped in post_body
   virtual task post_body();
      uvm_phase phase = get_starting_phase();
      if (phase != null)
        phase.drop_objection(this, {"Completed sequence '", get_full_name(), "'"});
   endtask : post_body

endclass : base_seq_slave

`endif

