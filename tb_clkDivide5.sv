`timescale 1ns/1ps

module tb_clkDivide5;

    logic clk;
    logic rst_n;
    logic clk5;

    // Instantiate the Unit Under Test (UUT)
    clkDivide5 uut (
        .clk(clk),
        .rst_n(rst_n),
        .clk5(clk5)
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
        #500;
        $finish;
    end

    // Monitor
    initial begin
        $dumpfile("clkDivide5.vcd");
        $dumpvars(0, tb_clkDivide5);
    end

    real time_rise, time_fall, period, high_time;
    
    always @(posedge clk5) begin
        if (rst_n) begin
            if (time_rise > 0) begin
                period = $realtime - time_rise;
                if (period != 50.0) $display("Error: Period is %t, expected 50.0", period);
                else $display("Pass: Period is correct: %t", period);
            end
            time_rise = $realtime;
        end
    end

    always @(negedge clk5) begin
        if (rst_n && time_rise > 0) begin
            high_time = $realtime - time_rise;
            if (high_time != 25.0) $display("Error: High time is %t, expected 25.0", high_time);
            else $display("Pass: High time is correct: %t (50%% duty cycle)", high_time);
        end
    end

endmodule
