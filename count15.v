module top_module (
    input clk,
    input reset,      
    output reg [3:0] q);
    integer i;
    always@(posedge clk)
        begin
            if(reset)
                q<=0;
            else
                q<=q+1;
        end
endmodule
