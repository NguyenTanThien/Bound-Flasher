module control(clk,rst_n,flick,lamp,control);
  input wire clk,rst_n, flick;
  input wire [15:0]lamp;
  output [1:0]control;
  wire [2:0]current,next;
  next      inst0(.lamp(lamp),
                  .flick(flick),
                  .current(current),
                  .next(next));
  current   inst1(.clk(clk),
                  .rst_n(rst_n),
                  .next(next),
                  .current(current));
  out_put   inst2(.current(current),
                  .out(control));
  
  
endmodule