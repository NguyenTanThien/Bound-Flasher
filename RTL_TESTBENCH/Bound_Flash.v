module bound_flash(clk,rst_n,flick,lamp);
  input wire clk,rst_n,flick;
  output wire [15:0]lamp;
  wire [1:0]control;
  control      inst0(.clk(clk),
                     .rst_n(rst_n),
                     .flick(flick),
                     .lamp(lamp),
                     .control(control));
  datapath     inst1(.clk(clk),
                     .rst_n(rst_n),
                     .in(control),
                     .lamp(lamp));
endmodule
