`ifndef SEQ_ITEM_SLAVE_SV
`define SEQ_ITEM_SLAVE_SV

parameter WIDTH = 16; 
parameter ADDRESS = 4;   

class seq_item_slave extends uvm_sequence_item;

    
    //Ports of Axi Slave Bus Interface axi_stream_cont
   logic tready;
   logic tvalid;
   logic tlast;
   rand logic [WIDTH - 1 : 0] tdata;

	`uvm_object_utils_begin(seq_item_slave)
	   
		`uvm_field_int(tready, UVM_DEFAULT)
		`uvm_field_int(tvalid, UVM_DEFAULT)
		`uvm_field_int(tlast, UVM_DEFAULT)
		`uvm_field_int(tdata, UVM_DEFAULT)
        
   	`uvm_object_utils_end
	
    function new (string name = "seq_item_slave");
       super.new(name);
    endfunction 

endclass : seq_item_slave

`endif

