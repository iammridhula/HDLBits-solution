module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;
    parameter a=0,b=1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state<=b;
        end else
            present_state<=next_state;
    end
    always@(*)
        begin
            case (present_state)
                a:next_state=in?a:b;
                b:next_state=in?b:a;
            endcase
        end
    assign out=present_state;
endmodule
