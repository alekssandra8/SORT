`ifndef SEQUENCER_SLAVE_SV
`define SEQUENCER_SLAVE_SV

class sequencer_slave extends uvm_sequencer#(seq_item_slave);

   `uvm_component_utils(sequencer_slave)

   function new(string name = "sequencer_slave", uvm_component parent = null);
      super.new(name,parent);
   endfunction
   
   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
  endfunction

endclass : sequencer_slave

`endif


