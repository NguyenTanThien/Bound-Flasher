module next(lamp,flick,current,next);
   input wire [15:0]lamp;
   input wire flick;
   input wire [2:0]current;
   output reg [2:0]next;
   
   always @(*)begin
     case(current)
       3'd0: begin
                if(flick == 1) next = 3'd1;
                else next = 3'd0;
         
            end
       3'd1: begin
              if(lamp[15:0] != 16'b0000000000111111) next = 3'd1;
              else next = 3'd2;
            end
       3'd2: begin
              if(lamp[15:0] != 16'b0000000000000000) next = 3'd2;
            else  next =3'd3;
         
            end
       3'd3: begin
              if(flick == 1)begin
                if(lamp[15:0] == 16'b0000000000111111 || lamp[15:0] == 16'b0000011111111111) next = 3'd2;
              else next = 3'd3;
              end
            else begin
                  if(lamp[15:0]== 16'b0000011111111111 ) next = 3'd4;
                  else next = 3'd3;
            end
         
          end
       3'd4: begin
            if(lamp[15:0] == 16'b0000000000011111) next = 3'd5;
            else next = 3'd4;
       end
       3'd5: begin
            if(flick == 1)begin
                  
                  if(lamp[15:0] == 16'b0000000000111111|| lamp[15:0]== 16'b0000011111111111) next = 3'd4;
                  else if(lamp[15:0]== 16'b1111111111111111 )next = 3'd6;
                      else next = 3'd5;
                  
                end
              else begin
                  	if(lamp[15:0]== 16'b1111111111111111) next = 3'd6;
               	  else next = 3'd5;
              end
       end
       3'd6: begin
            if(lamp[15:0] != 16'b0000000000000000) next = 3'd6;
              else next = 3'd0;
       end
       default: next = 3'd0;
       
     endcase
     
   end
   
 endmodule
