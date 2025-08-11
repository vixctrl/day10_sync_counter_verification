module sync_counter (
    input clk,          // Clock signal
    input reset,        // Active-high reset
    input enable,       // Enable counting
    output reg [3:0] q  // 4-bit output
);

always @(posedge clk) begin
    if (reset)
        q <= 4'b0000;           // Reset to 0
    else if (enable)
        q <= q + 1;             // Increment counter
end

endmodule
