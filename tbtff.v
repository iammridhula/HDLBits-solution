module top_module ();
	reg clk;
    reg reset;
    reg t;
    wire q;
    tff uut(.clk(clk), .reset(reset), .t(t), .q(q));
    initial begin 
        clk=1'b0;
        reset=1'b0;
    end
    always #5 clk=~clk;
    initial begin
        #5
        reset=1'b1;
        #20
        reset=1'b0;
    end
    always @(posedge clk)
    if (reset) t <= 1'b0;
    else t <= 1'b1;
endmodule
