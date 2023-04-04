`ifndef SEQUENCER_MASTER_SV
`define SEQUENCER_MASTER_SV

class sequencer_master extends uvm_sequencer#(seq_item_master);

   `uvm_component_utils(sequencer_master)

   function new(string name = "sequencer_master", uvm_component parent = null);
      super.new(name,parent);
   endfunction
   
   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
  endfunction

endclass : sequencer_master

`endif


