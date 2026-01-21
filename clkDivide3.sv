module clkDivide3
(
    input logic clk,
    input logic rst_n,
    output logic clk3
);

logic[1:0] cnt;
logic clk_p,clk_n;
always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        cnt<=0;
    else if(cnt==2)
        cnt<=0;
    else
        cnt<=cnt+1;
end

always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        clk_p<=0;
    else if(cnt==0)
        clk_p<=1;
    else
        clk_p<=0; 
end

always_ff@(negedge clk or negedge rst_n)begin
    if(!rst_n)
        clk_n<=0;
    else if(cnt==0)
        clk_n<=1;
    else
        clk_n<=0;
end

assign clk3 = clk_p | clk_n;

endmodule