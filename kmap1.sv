module top_module(
    input a,
    input b,
    input c,
    output reg out  ); 
    always@(*)
        begin
            if(a==0 && b==0 && c==0)
                out=1'b0;
            else
                out=1'b1;
        end
endmodule
