module top_module (input a, input b, input c, output out);
    wire outp;
    andgate inst1 (outp, a, b, c, 1'b1, 1'b1);
    assign out=~outp;
endmodule
