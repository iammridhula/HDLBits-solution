module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    integer i;
    reg[31:0] prev;
    always@(posedge clk)
        begin
            prev<=in;
            if(reset)
                out<=0;
            else
                begin
                    for(i=0;i<32;i=i+1)
                        out[i]=(prev[i]&~in[i])?1:out[i];
                end
        end

endmodule
