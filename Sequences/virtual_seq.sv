`ifndef VIRTUAL_SEQ_SV
 `define VIRTUAL_SEQ_SV

class virtual_seq extends base_seq_slave;
  
  `uvm_object_utils (virtual_seq)
  
  uvm_sequencer #(seq_item_slave) sequencer_slave_if; 
  
   function new(string name = "virtual_seq");
      super.new(name);
   endfunction

   virtual task body();
		//simple_seq_slave sequence_slave = sequence_slave::type_id::create("seq_slave");
		sequence_slave.start(sequencer_slave_if);	
   endtask : body

endclass : virtual_seq


class virtual_seq1 extends base_seq_master;
	
	`uvm_object_utils (virtual_seq1)
 
	uvm_sequencer #(seq_item_master) sequencer_master_if;
 
   function new(string name = "virtual_seq1");
      super.new(name);
   endfunction

   virtual task body();
		simple_seq_master sequence_master = simple_seq_master::type_id::create("seq_master");
		sequence_master.start(sequencer_master_if);
   endtask : body

endclass : virtual_seq1

`endif

