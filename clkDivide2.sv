module clkDivide2
(
    input logic clk,
    input logic rst_n,
    output logic clk2
);


always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        clk2<=0;
    else
        clk2<=~clk2;
end

endmodule