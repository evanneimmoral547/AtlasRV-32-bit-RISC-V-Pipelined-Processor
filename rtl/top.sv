// ============================================================
//  top.sv  –  Top-level wrapper for FPGA synthesis
//  Target: Xilinx Artix-7 (Basys3 / Nexys A7)
// ============================================================
module top (
    input  logic clk_100mhz,    // 100 MHz board clock
    input  logic btnC,          // centre button = active-high reset
    output logic [15:0] led     // status LEDs (optional debug)
);

    // Clock divider: 100 MHz → 25 MHz for processor
    logic clk_cpu;
    logic [1:0] clk_div;

    always_ff @(posedge clk_100mhz)
        clk_div <= clk_div + 1;

    assign clk_cpu = clk_div[1];

    // Synchronous reset synchroniser
    logic rst_sync_1, rst_sync;
    always_ff @(posedge clk_cpu) begin
        rst_sync_1 <= btnC;
        rst_sync   <= rst_sync_1;
    end

    // RISC-V core
    riscv_core u_core (
        .clk (clk_cpu),
        .rst (rst_sync)
    );

    // LED tie-off (expand for debug)
    assign led = 16'hCAFE;

endmodule
