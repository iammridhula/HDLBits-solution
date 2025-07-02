module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    reg [15:0] q2d [15:0];
    reg [255:0] qreg;
    integer u,d,l,r;
    integer i,j,cnt;
    always@(*)
        begin
            for(i=0;i<16;i=i+1)
                q2d[i]=q[16*i +: 16];
            for(i=0;i<16;i=i+1)
                for(j=0;j<16;j=j+1)
                    begin
                        u=i==15?0:i+1;
                        d=i==0?15:i-1;
                        l=j==15?0:j+1;
                        r=j==0?15:j-1;
                        cnt=q2d[u][l]+q2d[i][l]+q2d[d][l]+q2d[u][j]+q2d[d][j]+q2d[u][r]+q2d[i][r]+q2d[d][r];
                        case(cnt)
                            2:qreg[16*i+j]=q2d[i][j];
                            3:qreg[16*i+j]=1;
                            default:qreg[16*i+j]=0;
                        endcase
                    end
        end
    always@(posedge clk)
        begin
            if(load)
                q<=data;
            else
                q<=qreg;
        end
endmodule
