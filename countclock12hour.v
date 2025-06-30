module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);
    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00;
            mm <= 8'h00;
            hh <= 8'h12;
            pm <= 1'b0;
        end else if (ena) begin
            if (ss[3:0] == 4'h9) begin
                if (ss[7:4] == 4'h5) begin
                    ss <= 8'h00;
                    if (mm[3:0] == 4'h9) begin
                        if (mm[7:4] == 4'h5) begin
                            mm <= 8'h00;
                            if (hh == 8'h11) begin
                                hh <= 8'h12;
                                pm <= ~pm;
                            end else if (hh == 8'h12) begin
                                hh <= 8'h01;
                            end else if (hh[3:0] == 4'h9) begin
                                hh <= {hh[7:4] + 1, 4'h0};
                            end else begin
                                hh[3:0] <= hh[3:0] + 1;
                            end
                        end else begin
                            mm[7:4] <= mm[7:4] + 1;
                            mm[3:0] <= 4'h0;
                        end
                    end else begin
                        mm[3:0] <= mm[3:0] + 1;
                    end
                end else begin
                    ss[7:4] <= ss[7:4] + 1;
                    ss[3:0] <= 4'h0;
                end
            end else begin
                ss[3:0] <= ss[3:0] + 1;
            end
        end
    end
endmodule
