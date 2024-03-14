
module testbench();


localparam CLK_CYCLE = 10;

reg clk,rst_n,flick;


wire [15:0]lamp;
 
bound_flash inst(.clk(clk),
                  
		.rst_n(rst_n),
                  
		.flick(flick),
                  
		.lamp(lamp));



initial begin
    
	clk = 1'b0;
    rst_n = 1'b0;
    flick = 1'b0;

   	#CLK_CYCLE        rst_n = 1'b1; // reset off
 
   	#(CLK_CYCLE)        flick = 1'b1; //No1. normal case 
    
	#CLK_CYCLE        flick = 1'b0;
    
	#(CLK_CYCLE*58)   flick = 1;   // check kickback point 
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*17)   flick = 1;   //No2.kickback at lamp[5] up0_10
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*16)   flick = 1;    //No3.kickback at lamp[10] up0_10
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*60)   flick = 1;    
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*29)   flick = 1;   // No4.kickback at lamp[5]  up5_15
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*6)    flick = 1;   // No5.kickback_10_up5to15
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*5)    flick = 1;  // No6.four time kickback at lamp[5] up5to15
    
	#(CLK_CYCLE*8)    flick = 0;
    
	#(CLK_CYCLE*29)   flick = 1;  // No7.Non_kickback_test
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*13)   flick = 1;        //flick = 1 at lamp[1] when lamp turn on gradually
    
	#CLK_CYCLE        flick = 0;
    
	#CLK_CYCLE        flick = 1;        //flick = 1 at lamp[3] when lamp turn on gradually
    
	#CLK_CYCLE        flick = 0;
    
	#(CLK_CYCLE*30)   flick = 1; // No8.lamp_off_test       
    
	#CLK_CYCLE        flick = 0;        //when flick = 0
   
 	#(CLK_CYCLE*25)   flick = 1;        //when flick = 1
    
	#(CLK_CYCLE*3)        flick = 0;
    
	#(CLK_CYCLE*6)   flick = 1;        // flick = 1 at lamp[2] when lamp turn off gradually
    
	#CLK_CYCLE        flick = 0;  
    
	#(CLK_CYCLE*15)   rst_n = 0; // No9.reset_test 
    
	#(CLK_CYCLE*5) $finish;
  
	end
  
always #(CLK_CYCLE/2) clk <= ~clk;
initial begin
$recordfile("waves");
$recordvars("depth=0", testbench);
end


 endmodule

  
 
