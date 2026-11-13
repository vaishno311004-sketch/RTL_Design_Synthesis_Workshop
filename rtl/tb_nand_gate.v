`timescale 1ns/1ps

module tb_nand_gate;

reg a, b;
wire y;

nand_gate uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("nand_gate.vcd");
    $dumpvars(0, tb_nand_gate);

    $display("Time  a  b  y");
    $monitor("%0t  %b  %b  %b", $time, a, b, y);

    a = 0; b = 0;
    #10;
    a = 0; b = 1;
    #10;
    a = 1; b = 0;
    #10;
    a = 1; b = 1;
    #10;

    $finish;
end

endmodule
