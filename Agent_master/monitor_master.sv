`ifndef MONITOR_MASTER_SV
`define MONITOR_MASTER_SV

class monitor_master extends uvm_monitor;

   // control fileds
   sort_config cfg;

   uvm_analysis_port #(seq_item_master) item_collected_port;

   `uvm_component_utils_begin(monitor_master)
   `uvm_component_utils_end

   // The virtual interface used to drive and view HDL signals.
   virtual interface axis_if vif;

   // current transaction
   seq_item_master curr_it, clone_curr_it;
   // int ref_data_flag = 0;

   // coverage can go here
   // ...

   function new(string name = "monitor_master", uvm_component parent = null);
        super.new(name,parent);      
   endfunction


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      curr_it = seq_item_master::type_id::create("curr_it", this);

      item_collected_port = new("item_collected_port", this);

      if (!uvm_config_db#(virtual axis_if)::get(this, "*", "axis_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
      
   endfunction : build_phase

   task main_phase(uvm_phase phase);
 
   endtask : main_phase

endclass : monitor_master


`endif