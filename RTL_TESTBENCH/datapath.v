module datapath(clk,rst_n,in,lamp);
   input wire clk,rst_n;
  input wire [1:0]in;
  output wire [15:0]lamp;
  reg [15:0]out_reg;
  
  assign lamp[15:0] = (in == 0) ? 16'b0000000000000000 :
                      (in == 2'd1) ? {out_reg[14:0],1'b1} :
                      (in == 2'd2) ? {1'b0,out_reg[15:1]} : 16'b0000000000000000;
                      
  
  always @(posedge clk or negedge rst_n)begin
    if(rst_n ==0) out_reg <=0;
    else out_reg <= lamp;
    
  end
  endmodule
