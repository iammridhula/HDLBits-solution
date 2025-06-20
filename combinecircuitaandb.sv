module top_module (input x, input y, output z);
    wire [3:0] z1;
    A A1 (x, y, z1[0]);
    B B1 (x, y, z1[1]);
    A A2 (x, y, z1[2]);
    B B2 (x, y, z1[3]);
    assign z = (z1[0] | z1[1]) ^ (z1[2] & z1[3]);

endmodule

module A (
    input x,
    input y,
    output z
);
	assign z = (x ^ y) & x;
endmodule

module B (
    input x,
    input y,
    output z
);
	assign z = ~(x ^ y);
endmodule
