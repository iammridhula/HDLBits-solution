module top_module(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] sum
);
    wire [15:0] sum1,sum2;
    wire cout;
    add16 ins1(a[15:0],b[15:0],1'b0,sum[15:0],cout);
    add16 ins2(a[31:16],b[31:16],1'b0,sum1,);
    add16 ins3(a[31:16],b[31:16],1'b1,sum2,);
    always @(*)
        begin 
            case(cout)
                1'b0:sum[31:16]=sum1;
                1'b1:sum[31:16]=sum2;
            endcase
        end
endmodule
