`ifndef AGENT_PKG_SLAVE
`define AGENT_PKG_SLAVE

package agent_pkg_slave;
 
   import uvm_pkg::*;
   `include "uvm_macros.svh"

   //////////////////////////////////////////////////////////
   // include Agent components : driver,monitor,sequencer
   /////////////////////////////////////////////////////////
   import configurations_pkg::*;   
   
   
   `include "seq_item_slave.sv"
   `include "sequencer_slave.sv"
   `include "driver_slave.sv"
   `include "monitor_slave.sv"
   `include "agent_slave.sv"
   

endpackage

`endif




