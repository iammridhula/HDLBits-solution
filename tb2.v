module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    q7 uut(.clk(clk), .in(in), .s(s), .out(out));
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        in=1'b0;
        s=3'b010;
  		#10
    	s=3'b110;
   		#10
    	s=3'b010;
    	in=1'b1;
        #10
        s=3'b111;
        in=1'b0;
        #10
        s=3'b000;
        in=1'b1;
        #30
        in=1'b0;
    end
endmodule
