module clkDivide10w4
(
    input logic clk,
    input logic rst_n,
    output logic clk10
);

logic [3:0] cnt;
always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        cnt<=0;
    else if(cnt==9)
        cnt<=0;
    else
        cnt<=cnt+1;
end


always_ff@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        clk10<=0;
    else if(cnt==0 || cnt==1 || cnt==2 || cnt==3)
        clk10<=1;
    else 
        clk10<=0;
end



endmodule