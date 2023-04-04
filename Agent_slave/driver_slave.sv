`ifndef DRIVER_SLAVE_SV
`define DRIVER_SLAVE_SV

class driver_slave extends uvm_driver#(seq_item_slave);

   `uvm_component_utils(driver_slave)
   
   virtual interface axis_if vif;
	int num_of_tr = 0;
   sort_config cfg;
   
   function new(string name = "driver_slave", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      if (!uvm_config_db#(virtual axis_if)::get(this, "*", "axis_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})


      if(!uvm_config_db#(sort_config)::get(this, "", "sort_config", cfg))
        `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})

   endfunction : build_phase

   task main_phase(uvm_phase phase);
	forever begin
		@(posedge vif.clk);
		if(vif.rst)
		begin
			vif.tlast <= 1'b0;	
			if (vif.tready == 1'b1) begin
				seq_item_port.get_next_item(req);
				seq_item_port.item_done();
				
				vif.tdata <= req.tdata;
				num_of_tr++;
			end
			if (vif.tlast == 1'b1) begin
				num_of_tr = 0;
				
			end
		end
	end

   endtask : main_phase

endclass : driver_slave

`endif


