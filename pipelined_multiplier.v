//====================================================
// Verified 4x4 Pipelined Multiplier (4 Stages)
//====================================================

module pipelined_multiplier_4x4_final (
    input  wire        clk,
    input  wire [3:0]  a,
    input  wire [3:0]  b,
    output reg  [7:0]  product
);

    // Stage 1: Register Inputs and Generate Partial Products
    reg [3:0] a_reg1, b_reg1;
    reg [7:0] pp0_reg, pp1_reg, pp2_reg, pp3_reg;

    always @(posedge clk) begin
        a_reg1 <= a;
        b_reg1 <= b;

        pp0_reg <= {4'b0000, (a & {4{b[0]}})};
        pp1_reg <= {3'b000,  (a & {4{b[1]}})} << 1;
        pp2_reg <= {2'b00,   (a & {4{b[2]}})} << 2;
        pp3_reg <= {1'b0,    (a & {4{b[3]}})} << 3;
    end

    // Stage 2: Add pp0 + pp1
    reg [7:0] sum1_reg2, pp2_reg2, pp3_reg2;
    always @(posedge clk) begin
        sum1_reg2 <= pp0_reg + pp1_reg;
        pp2_reg2  <= pp2_reg;
        pp3_reg2  <= pp3_reg;
    end

    // Stage 3: Add pp2 + pp3
    reg [7:0] sum1_reg3, sum2_reg3;
    always @(posedge clk) begin
        sum1_reg3 <= sum1_reg2;
        sum2_reg3 <= pp2_reg2 + pp3_reg2;
    end

    // Stage 4: Final Add
    always @(posedge clk) begin
        product <= sum1_reg3 + sum2_reg3;
    end

endmodule
