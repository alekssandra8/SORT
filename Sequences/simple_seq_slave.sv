`ifndef SIMPLE_SEQ_SLAVE_SV
 `define SIMPLE_SEQ_SLAVE_SV

class simple_seq_slave extends base_seq_slave;

   `uvm_object_utils (simple_seq_slave)

   static reg [15:0] mem_content [0 : 3] = '{5, 1, 4, 3};

  
   function new(string name = "simple_seq_slave");
      super.new(name);
      
   endfunction

   virtual task body();
      for (int i = 0; i < 15; i++) begin

        `uvm_do_with(req, {req.tdata == mem_content[i];})

      end

   endtask : body

endclass : simple_seq_slave

`endif


