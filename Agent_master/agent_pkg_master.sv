`ifndef AGENT_PKG_MASTER
`define AGENT_PKG_MASTER

package agent_pkg_master;
 
   import uvm_pkg::*;
   `include "uvm_macros.svh"

   //////////////////////////////////////////////////////////
   // include Agent components : driver,monitor,sequencer
   /////////////////////////////////////////////////////////
   import configurations_pkg::*;   
   
   
   `include "seq_item_master.sv"
   `include "sequencer_master.sv"
   `include "driver_master.sv"
   `include "monitor_master.sv"
   `include "agent_master.sv"
   

endpackage

`endif




