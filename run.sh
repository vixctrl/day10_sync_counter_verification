# Compile
iverilog -o counter_tb tb_sync_counter.v sync_counter.v

# Run simulation
vvp counter_tb

# View waveform
gtkwave sync_counter.vcd
