`ifndef SIMPLE_SEQ_MASTER_SV
`define SIMPLE_SEQ_MASTER_SV

class simple_seq_master extends base_seq_master;

   `uvm_object_utils(simple_seq_master)

   simple_seq_slave slave_seq;

   rand reg [15:0] mem_content [0:3];

   function new(string name = "simple_seq_master");
      super.new(name);
   endfunction

   virtual task body();
      // Set the values of the mem_content array in the slave_seq instance
      for (int i = 0; i < 4; i++) begin
         slave_seq.mem_content[i] = mem_content[i];
      end

      // Create the request object
      req = simple_bus_req::type_id::create("req");

      // Send the request to the slave
      `uvm_do(slave_seq.req, req)

      // Wait for the response
      rsp = simple_bus_rsp::type_id::create("rsp");
      `uvm_do(slave_seq.rsp, rsp)
   
      if (rsp.tdata == req.tdata) begin
      
         `uvm_do_with(req, {req.odata == mem_content[i];})
         
      end
   endtask : body

endclass : simple_seq_master

`endif
