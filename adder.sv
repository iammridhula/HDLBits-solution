module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0] c1;
    fadd ins1(x[0],y[0],1'b0,c1[0],sum[0]);
    fadd ins2(x[1],y[1],c1[0],c1[1],sum[1]);
    fadd ins3(x[2],y[2],c1[1],c1[2],sum[2]);
    fadd ins4(x[3],y[3],c1[2],sum[4],sum[3]);
endmodule
module fadd( 
    input a, b, cin,
    output cout, sum );
    assign {cout,sum}=a+b+cin;
endmodule
