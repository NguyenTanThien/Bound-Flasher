module out_put(current,out);

  input wire [2:0]current;
  output wire [1:0]out;
  
  assign out = (current == 3'd0) ? 2'b00 :
                (current == 3'd1) ? 2'b01 :
                (current == 3'd2) ? 2'b10 :
                (current == 3'd3) ? 2'b01 :
                (current == 3'd4) ? 2'b10 :
                (current == 3'd5) ? 2'b01 :
                (current == 3'd6) ? 2'b10 : 2'b00;
                
  endmodule

