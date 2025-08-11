`timescale 1ns/1ps
module tb_sync_counter;

reg clk;
reg reset;
reg enable;
wire [3:0] q;

// Instantiate the counter
sync_counter uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .q(q)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("sync_counter.vcd");
    $dumpvars(0, tb_sync_counter);

    clk = 0;
    reset = 1;
    enable = 0;

    // Reset for 2 cycles
    #10 reset = 0;

    // Enable counting
    enable = 1;
    #100;

    // Disable counting
    enable = 0;
    #40;

    // Re-enable
    enable = 1;
    #50;

    $finish;
end

endmodule
