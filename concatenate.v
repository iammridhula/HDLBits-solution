module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );
    wire [31:0] comb;
    assign comb={a,b,c,d,e,f,2'b11};
    assign w=comb[31:24];
    assign x=comb[23:16];
    assign y=comb[15:8];
    assign z=comb[7:0];
endmodule
