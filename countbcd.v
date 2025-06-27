module top_module (
    input clk,
    input reset,  
    output [3:1] ena,
    output [15:0] q);
    counter ins0 (clk, reset, 1'b1, q[3:0]);
	counter ins1 (clk, reset, ena[1], q[7:4]);
	counter ins2 (clk, reset, ena[2], q[11:8]);
	counter ins3 (clk, reset, ena[3], q[15:12]);
	assign ena = {q[11:0] == 12'h999, q[7:0] == 8'h99, q[3:0] == 4'h9};
endmodule

module counter (
    input clk,
    input reset,
    input ena,
    output reg [3:0] q
);
always @(posedge clk)
    if (reset) q <= 0;
    else if (~ena) q <= q;
    else q <= q < 9 ? q + 1 : 0;
endmodule
