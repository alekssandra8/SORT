`ifndef AGENT_MASTER_SV
`define AGENT_MASTER_SV

class agent_master extends uvm_agent;

   // components
   driver_master drv;
   sequencer_master seqr;
   monitor_master mon;
   
   virtual interface axis_if vif;
   
   // configuration
   sort_config cfg;
     
   `uvm_component_utils_begin (agent_master)
        `uvm_field_object(cfg, UVM_DEFAULT)
		`uvm_field_object(drv, UVM_DEFAULT)
		`uvm_field_object(seqr, UVM_DEFAULT)
		`uvm_field_object(mon, UVM_DEFAULT)
   `uvm_component_utils_end

   function new(string name = "agent_master", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      if(!uvm_config_db#(sort_config)::get(this, "", "sort_config", cfg))
        `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})
      
      /************Setting to configuration database********************/
         uvm_config_db#(sort_config)::set(this, "mon", "sort_config", cfg);
         uvm_config_db#(sort_config)::set(this, "drv", "sort_config", cfg);
		 
         mon = monitor_master::type_id::create("mon", this);
         if(cfg.is_active == UVM_ACTIVE) begin
           drv = driver_master::type_id::create("drv", this);
           seqr = sequencer_master::type_id::create("seqr", this);
         end		 
   endfunction : build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(cfg.is_active == UVM_ACTIVE) begin
         drv.seq_item_port.connect(seqr.seq_item_export);
      end
   endfunction : connect_phase

endclass : agent_master

`endif
