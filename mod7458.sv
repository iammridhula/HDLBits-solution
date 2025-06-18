module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire a1y,a2y,c2y,f1y;
    assign a1y=p1a&p1c&p1b;
    assign f1y=p1f&p1e&p1d;
    assign p1y=a1y|f1y;
    assign a2y=p2a&p2b;
    assign c2y=p2c&p2d;
    assign p2y=a2y|c2y;
endmodule
