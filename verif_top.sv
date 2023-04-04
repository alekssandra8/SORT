`ifndef VERIF_TOP_SV
 `define VERIF_TOP_SV
 
 module verif_top;

   import uvm_pkg::*;     // import the UVM library
   `include "uvm_macros.svh" // Include the UVM macros

   import test_pkg::*;

   logic clk;
   logic rst;
    
   // interface
	slave_if slave_if(clk, reset);
	master_if master_if(clk, reset);

   sort_top DUT(
			.clk (clk),
			.reset (rst),

			.tready (slave_if.tready),
			.tvalid (slave_if.tvalid),
			.tlast (slave_if.tlast),
			.tdata (slave_if.tdata),
			
			.oready (master_if.oready),
			.ovalid (master_if.ovalid),
			.olast (master_if.olast),
			.odata (master_if.odata) 
            );

   // run test
   initial begin   
   
	  uvm_config_db#(virtual slave_if)::set(null, "*", "slave_if", slave_if);
      uvm_config_db#(virtual master_if)::set(null, "*", "master_if", master_if);
	  run_test();
   end
    
   // clock and reset init.
   initial begin
      clk <= 1;
      rst <= 0;
	  
	         for (int i = 0; i < 8; i++) begin
	   @(posedge clk);
	   
       end
       rst <= 7'h7f;
	   
   end

   // clock generation
   always #50 clk = ~clk;
   
endmodule : verif_top

`endif

