`timescale 1ns/1ps

module tb_pipelined_multiplier_4x4_final;

    reg clk;
    reg [3:0] a, b;
    wire [7:0] product;

    pipelined_multiplier_4x4_final dut (
        .clk(clk),
        .a(a),
        .b(b),
        .product(product)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("pipelined_multiplier_final.vcd");
        $dumpvars(0, tb_pipelined_multiplier_4x4_final);

        clk = 0;
        a = 0;
        b = 0;

        $display("-------------------------------------------------------------");
        $display("Time\t| CLK |  A  |  B  |  Product");
        $display("-------------------------------------------------------------");
        $monitor("%4t\t|  %b  | %2d | %2d | %3d", $time, clk, a, b, product);

        #12 a=4'd3;  b=4'd5;   // 15
        #10 a=4'd7;  b=4'd2;   // 14
        #10 a=4'd8;  b=4'd9;   // 72
        #10 a=4'd15; b=4'd15;  // 225
        #10 a=4'd6;  b=4'd4;   // 24
        #100 $finish;
    end

endmodule
