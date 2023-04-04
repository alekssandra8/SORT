`ifndef AXIS_IF_SV
 `define AXIS_IF_SV
 
   parameter WIDTH = 16; 
   parameter ADDRESS = 4;  


interface slave_if (input clk, input reset);

   // input axi logic -- slave
   logic tready;
   logic tvalid;
   logic tlast;
   logic [WIDTH - 1 : 0] tdata;
   
endinterface : slave_if


interface master_if (input clk, input reset);
   
   // output axi logic -- master
   logic oready;
   logic ovalid;
   logic olast;
   logic [WIDTH - 1 : 0] odata;
 
endinterface : master_if
`endif
