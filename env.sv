`ifndef ENV_SV
 `define ENV_SV

class env extends uvm_env;

   agent_master agent1;
   agent_slave agent2;
   sort_config cfg;
	//scoreboard scbd;

   virtual interface slave_if vif;
   virtual interface master_if vif1;
   `uvm_component_utils (env)

   function new(string name = "env", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      if(!uvm_config_db#(virtual slave_if)::get(this, "", "slave_if", vif))
        `uvm_fatal("NOCONFIG",{"Virtual interface must be set for: ",get_full_name(),".vif"})
		
      if(!uvm_config_db#(virtual master_if)::get(this, "", "slave_if", vif1))
        `uvm_fatal("NOCONFIG",{"Virtual interface must be set for: ",get_full_name(),".vif1"}) 
		
      if(!uvm_config_db#(sort_config)::get(this, "", "sort_config", cfg))
        `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})
		
        /************Setting to configuration database********************/
      uvm_config_db#(sort_config)::set(this, "*agent", "sort_config", cfg);
      uvm_config_db#(virtual master_if)::set(this, "interface_agent1", "slave_if", vif1);
      uvm_config_db#(virtual slave_if)::set(this, "interface_agent2", vif);	  
      /*****************************************************************/

      agent1 = agent_master::type_id::create("interface_agent1", this);
      agent2 = agent_slave::type_id::create("interface_agent2", this);
	  
   endfunction : build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
	    //agent1.mon.item_collected_port.connect(scbd.port_master);
		//agent2.mon.item_collected_port.connect(scbd.port_slave);
   endfunction : connect_phase

endclass : env

`endif

