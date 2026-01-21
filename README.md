# Clock-Divider
Implementation of common clock divider circuits in SystemVerilog.

This project covers both even and odd clock division techniques, focusing on duty-cycle control and synthesizable design practices.


## Even divider
An even clock divider is implemented using a counter-based approach.

* A counter is used to count up to N/2, corresponding to half of the target clock period.

* The output clock toggles when the counter reaches predefined thresholds.

* By adjusting the toggle conditions at different counter values, a specific and symmetric duty cycle can be generated.

* This approach is fully synchronous and suitable for synthesis.


## Odd divider
An odd clock divider requires handling fractional duty cycles.

* A counter is used to count up to N, where the effective duty cycle is N/2.

* Two clocks are generated:

* clk_p triggered on the positive edge

* clk_n triggered on the negative edge

* clk_p and clk_n logically OR-ed together to create a clock waveform with a half-cycle overlap, effectively achieving a 0.5-cycle resolution.

* This method enables odd division ratios while maintaining 50% duty cycle.

