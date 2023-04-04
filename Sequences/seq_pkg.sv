`ifndef SEQ_PKG_SV
`define SEQ_PKG_SV

package seq_pkg;

	import uvm_pkg::*;      // import the UVM library
	`include "uvm_macros.svh" // Include the UVM macros
	
	import agent_pkg_slave::seq_item_slave;
	import agent_pkg_slave::sequencer_slave;
	`include "base_seq_slave.sv"
	`include "simple_seq_slave.sv"
	
	import agent_pkg_master::seq_item_master;
	import agent_pkg_master::sequencer_master;
	`include "base_seq_master.sv"
	`include "simple_seq_master.sv"

	`include "virtual_seq.sv"
endpackage : seq_pkg
`endif
