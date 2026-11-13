`timescale 1ns/1ps

module tb_mux2;

    reg a, b, sel;
    wire y;

    // Instantiate the 2:1 multiplexer
    mux2 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux2.vcd");
        $dumpvars(0, tb_mux2);

        $display("Time  a  b  sel  y");
        $monitor("%0t   %b  %b   %b   %b",
                 $time, a, b, sel, y);

        a = 0; b = 0; sel = 0;
        #10;
        a = 0; b = 1; sel = 0;
        #10;
        a = 1; b = 0; sel = 0;
        #10;
        a = 0; b = 1; sel = 1;
        #10;
        a = 1; b = 0; sel = 1;
        #10;
        a = 1; b = 1; sel = 1;
        #10;

        $finish;
    end

endmodule
