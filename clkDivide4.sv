module clkDivide4
(
    input logic clk,
    input logic rst_n,
    output logic clk4
);

logic[2:0] cnt;
// logic clk_p,clk_n;
always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        cnt<=0;
    else if(cnt==3)
        cnt<=0;
    else
        cnt<=cnt+1;
end

always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        clk4<=0;
    else if(cnt==0 || cnt==1)
        clk4<=1;
    else
        clk4<=0; 
end


endmodule