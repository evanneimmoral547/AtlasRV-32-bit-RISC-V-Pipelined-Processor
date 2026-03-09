// ============================================================
//  mem_stage.sv  –  Memory Access (MEM) Stage
//  32-bit data memory (byte-addressed, word-aligned accesses)
// ============================================================
module mem_stage #(
    parameter MEM_DEPTH = 256
)(
    input  logic        clk, rst,
    input  logic        mem_read_m,
    input  logic        mem_write_m,
    input  logic [2:0]  funct3_m,          // for byte/half/word select
    input  logic [31:0] alu_result_m,      // memory address
    input  logic [31:0] write_data_m,      // store data
    output logic [31:0] read_data_m        // load data
);

    logic [31:0] dmem [0:MEM_DEPTH-1];

    initial begin
        for (int i = 0; i < MEM_DEPTH; i++)
            dmem[i] = 32'b0;
    end

    // Synchronous write
    always_ff @(posedge clk) begin
        if (mem_write_m)
            dmem[alu_result_m[31:2]] <= write_data_m; // word-aligned
    end

    // Asynchronous read with sign/zero extension
    always_comb begin
        if (mem_read_m) begin
            unique case (funct3_m)
                3'b010 : read_data_m = dmem[alu_result_m[31:2]];  // LW
                3'b001 : read_data_m = {{16{dmem[alu_result_m[31:2]][15]}},
                                         dmem[alu_result_m[31:2]][15:0]};  // LH
                3'b000 : read_data_m = {{24{dmem[alu_result_m[31:2]][7]}},
                                         dmem[alu_result_m[31:2]][7:0]};   // LB
                3'b101 : read_data_m = {16'b0, dmem[alu_result_m[31:2]][15:0]}; // LHU
                3'b100 : read_data_m = {24'b0, dmem[alu_result_m[31:2]][7:0]};  // LBU
                default: read_data_m = dmem[alu_result_m[31:2]];
            endcase
        end else begin
            read_data_m = 32'bx;
        end
    end

endmodule
