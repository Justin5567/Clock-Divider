`timescale 1ns/1ps

module tb_clkDivide10w4;

    logic clk;
    logic rst_n;
    logic clk10;

    // Instantiate the Unit Under Test (UUT)
    clkDivide10w4 uut (
        .clk(clk),
        .rst_n(rst_n),
        .clk10(clk10)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period -> 100MHz
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        rst_n = 0;

        // Wait 100 ns for global reset to finish
        #100;
        rst_n = 1;

        // Run for a bit
        #1000;
        $finish;
    end

    // Monitor
    initial begin
        $dumpfile("clkDivide10w4.vcd");
        $dumpvars(0, tb_clkDivide10w4);
    end

    real time_rise, period, high_time;
    
    always @(posedge clk10) begin
        if (rst_n) begin
            if (time_rise > 0) begin
                period = $realtime - time_rise;
                if (period != 100.0) $display("Error: Period is %t, expected 100.0", period);
                else $display("Pass: Period is correct: %t", period);
            end
            time_rise = $realtime;
        end
    end

    always @(negedge clk10) begin
        if (rst_n && time_rise > 0) begin
            high_time = $realtime - time_rise;
            if (high_time != 40.0) $display("Error: High time is %t, expected 40.0", high_time);
            else $display("Pass: High time is correct: %t (40%% duty cycle)", high_time);
        end
    end

endmodule
