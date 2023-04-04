`ifndef DRIVER_MASTER_SV
`define DRIVER_MASTER_SV

class driver_master extends uvm_driver#(seq_item_master);

   `uvm_component_utils(driver_master)
   
   virtual interface axis_if vif;
   sort_config cfg;
   
   int num_of_tr = 0;
   
   function new(string name = "driver_master", uvm_component parent = null);
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
				vif.olast <= 1'b0;
				if(vif.oready == 1'b1) begin
					seq_item_port.get_next_item(req);
					seq_item_port.item_done();
					vif.odata <= req.odata;
					num_of_tr++;
					
					if(vif.olast == 1'b1) begin
						num_of_tr = 0;
					end
				end
			end
		end
   endtask : main_phase

endclass : driver_master

`endif


