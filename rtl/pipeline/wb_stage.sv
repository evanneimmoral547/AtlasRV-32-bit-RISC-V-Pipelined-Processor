// ============================================================
//  wb_stage.sv  –  Write-Back (WB) Stage
//  Selects result to write back to register file
// ============================================================
module wb_stage (
    input  logic [1:0]  mem_to_reg_w,  // 00=ALU, 01=MEM, 10=PC+4
    input  logic [31:0] alu_result_w,
    input  logic [31:0] read_data_w,
    input  logic [31:0] pc_plus4_w,
    output logic [31:0] result_w
);

    always_comb begin
        unique case (mem_to_reg_w)
            2'b00 : result_w = alu_result_w;
            2'b01 : result_w = read_data_w;
            2'b10 : result_w = pc_plus4_w;
            default: result_w = alu_result_w;
        endcase
    end

endmodule
