module current(clk,rst_n,next,current);
  input wire clk, rst_n;
  input wire [2:0]next;
  output reg [2:0]current;
  always @(posedge clk or negedge rst_n)begin
    if(rst_n ==0) current<=3'd0;
    else current <= next;
end


endmodule
