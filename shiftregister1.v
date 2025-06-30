module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);
    reg [2:0] q;
    always@(posedge clk)
        begin
            if(~resetn)
            {q,out}<=0;
            else
            {q,out}<={in,q};
        end
endmodule
