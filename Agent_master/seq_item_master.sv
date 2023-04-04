`ifndef SEQ_ITEM_MASTER_SV
`define SEQ_ITEM_MASTER_SV

parameter WIDTH = 16; 
parameter ADDRESS = 4;  

class seq_item_master extends uvm_sequence_item;


    //Ports of Axi Master Bus Interface axi_stream_cont
   logic oready;
   logic ovalid;
   logic olast;
   rand logic [WIDTH - 1 : 0] odata;

	`uvm_object_utils_begin(seq_item_master)
	   
		`uvm_field_int(oready, UVM_DEFAULT)
		`uvm_field_int(ovalid, UVM_DEFAULT)
		`uvm_field_int(olast, UVM_DEFAULT)
		`uvm_field_int(odata, UVM_DEFAULT)        
		
   	`uvm_object_utils_end
	
    function new (string name = "seq_item_master");
       super.new(name);
    endfunction 

endclass : seq_item_master

`endif

